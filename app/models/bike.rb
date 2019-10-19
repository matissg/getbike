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
    yes = { available: true, text: "YES, there's a bike for this time range!" }
    no = { available: false, text: "NO, there isn't any free bike for this time range!" }
    first_available_for_time(range) != nil ? yes : no
  end

  def self.first_available_for_time(range)
    booked = booked_in_time(range)
    Bike.kept.size - booked.size > 0 ? least_used_excluding(booked) : nil
  end

  def self.next_number
    self.any? ? self.last.number.split('_').last.to_i + 1 : ''
  end


  private

  def self.least_used_excluding(booked)
    Bike.kept.where.not(id: booked).includes(:rides).map { |bike|
      [ bike.id, bike.rides.size ]
    }.sort_by { |it| it[1] }.first[0]
  end

  def self.booked_in_time(range)
    from, to = range.split(' - ')
    Ride.end_in_future.map { |ride|
      ride.bike_id if (ride.start_at..ride.end_at).overlaps?(
        Time.parse(from)..Time.parse(to)
      )
    }.compact.uniq
  end

  def remove_future_scheduled_rides
    Ride.start_in_future.destroy_by(bike_id: self.id)
  end

end
