class Ride < ApplicationRecord
  include Discard::Model, ActionView::Helpers::DateHelper

  attr_accessor :starts_ends
  #-- Associations -------------------------------------------------------------
  belongs_to :employee
  belongs_to :bike
  #-- Validations --------------------------------------------------------------
  validates :start_at, :end_at, presence: true
  validate :start_is_in_future
  validate :start_is_before_end
  validate :employee_is_active
  #-- Scopes -------------------------------------------------------------------
  scope :end_in_future, -> { where('end_at > ?', Time.current) }
  scope :start_in_future, -> { where('start_at > ?', Time.current) }
  #-- Callbacks ----------------------------------------------------------------
  before_destroy :validate_if_future_ride


  def starts_ends=(range)
    from, to = range.split(' - ')
    self.start_at = Time.parse(from)
    self.end_at = Time.parse(to)
  end

  def period
    self.start_at.strftime("%d.%m.%Y %H:%M") + " - " + self.end_at.strftime("%d.%m.%Y %H:%M")
  end

  def total_time
    distance_of_time_in_words(self.end_at, self.start_at)
  end


  private

  def start_is_in_future
    errors.add(:start_at, "must be in future!") unless (
      start_at != nil && end_at != nil && start_at > Time.current
    )
  end

  def start_is_before_end
    errors.add(:start_at, "must be before end_at!") unless (
      start_at != nil && end_at != nil && start_at < end_at
    )
  end

  def employee_is_active
    errors.add(:employee_id, "must be active!") unless !self.employee.discarded?
  end

  def validate_if_future_ride
    errors.add(:base, "Can't delete running ride!") unless self.start_at > Time.current
  end

end
