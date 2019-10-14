class Employee < ApplicationRecord
  include Discard::Model

  #-- Associations -------------------------------------------------------------
  has_many :rides
  has_many :bikes, through: :rides
  #-- Validations --------------------------------------------------------------
  validates :name, length: { in: 1..100 }
  #-- Callbacks ----------------------------------------------------------------
  after_discard :remove_future_scheduled_rides


  def remove_future_scheduled_rides
    Ride.where(employee_id: self.id).start_in_future.destroy_all
  end

end
