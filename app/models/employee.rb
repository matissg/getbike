class Employee < ApplicationRecord
  include Discard::Model

  #-- Associations -------------------------------------------------------------
  has_many :rides
  has_many :bikes, through: :rides
  #-- Validations --------------------------------------------------------------
  validates :name, length: { in: 1..100 }
  #-- Callbacks ----------------------------------------------------------------
  after_discard :remove_future_scheduled_rides


  private

  def remove_future_scheduled_rides
    Ride.start_in_future.destroy_by(employee_id: self.id)
  end

end
