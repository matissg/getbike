class Bike < ApplicationRecord
  include Discard::Model

  #-- Associations -------------------------------------------------------------
  has_many :rides
  has_many :employees, through: :rides
  #-- Validations --------------------------------------------------------------
  validates :number, length: { in: 1..25 }, uniqueness: true
  #-- Callbacks ----------------------------------------------------------------
  after_discard :remove_future_scheduled_rides


  def self.availability_message(range)
    yes = { available: true, text: 'YES, you can get a bike!' }
    no = { available: false, text: 'Sorry, no free bike available!' }
    first_available_for_time(range) != nil ? yes : no
  end

  def self.first_available_for_time(range)
    bikes = self.booked_in_time(range)
    bikes.any? ? self.least_used_excluding_booked(bikes) : Bike.kept.first.id
  end

  def self.least_used_excluding_booked(bikes)
    Bike.kept.where.not(id: bikes).includes(:rides).map { |bike|
      [bike.id, bike.rides.size]
    }.sort_by { |i| i[1] }.first[0]
  end

  def self.booked_in_time(range)
    start_str, end_str = range.split(' - ')
    from = Time.parse(start_str)
    to = Time.parse(end_str)
    Ride.end_in_future.map { |ride|
      ride.bike_id if (ride.start_at..ride.end_at).overlaps?(from..to)
    }.compact.uniq
  end

  def remove_future_scheduled_rides
    Ride.where(bike_id: self.id).start_in_future.destroy_all
  end

end
