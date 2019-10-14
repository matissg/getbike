class Ride < ApplicationRecord
  include Discard::Model, ActionView::Helpers::DateHelper

  attr_accessor :starts_ends
  #-- Associations -------------------------------------------------------------
  belongs_to :employee
  belongs_to :bike
  #-- Validations --------------------------------------------------------------
  validates :start_at, :end_at, presence: true
  validate :must_start_in_future
  validate :must_end_to_be_after_start
  validate :must_be_active_employee
  #-- Scopes -------------------------------------------------------------------
  scope :end_in_future, -> { where('end_at > ?', Time.current) }
  scope :start_in_future, -> { where('start_at > ?', Time.current) }
  #-- Callbacks ----------------------------------------------------------------
  before_destroy :check_if_is_in_future


  def starts_ends=(range)
    start_str, end_str = range.split(' - ')
    from = Time.parse(start_str)
    to = Time.parse(end_str)
    self.start_at = from
    self.end_at = to
  end

  def must_start_in_future
    errors.add(:start_at, "must be in future!") unless (
      start_at != nil && end_at != nil && start_at > Time.current
    )
  end

  def must_end_to_be_after_start
    errors.add(:start_at, "must be before end_at!") unless (
      start_at != nil && end_at != nil && start_at < end_at
    )
  end

  def must_be_active_employee
    errors.add(:employee_id, "must be active!") unless !self.employee.discarded?
  end

  def period
    self.start_at.strftime("%d.%m.%Y %H:%M") + " - " + self.end_at.strftime("%d.%m.%Y %H:%M")
  end

  def total_time
    distance_of_time_in_words(self.end_at, self.start_at)
  end

  def check_if_is_in_future
    errors.add(:base, "Cannot delete running ride!") unless self.start_at > Time.current
  end

end
