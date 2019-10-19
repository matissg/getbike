require 'rails_helper'

RSpec.describe Bike, type: :model do

  subject { described_class.new(number: "bike_1") }

  it "is valid with correct attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a number" do
    subject.number = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with too long number" do
    subject.number = ('1'*26)
    expect(subject).to_not be_valid
  end

  it "is available if NOT taken for ride in given time" do
    employee = Employee.create!(name: "Matiss")
    bike = Bike.create!(number: 'bike_2')
    period = "#{1.day.from_now} - #{2.days.from_now}"
    different_period = "#{4.day.from_now} - #{5.days.from_now}"
    Ride.create!(
      employee_id: employee.id,
      bike_id: bike.id,
      starts_ends: period
    )
    expect( Bike.first_available_for_time(different_period) ).to_not be_nil
  end

  it "is not available if taken for ride in given time" do
    employee = Employee.create!(name: "Matiss")
    bike = Bike.create!(number: 'bike_2')
    period = ("#{1.day.from_now} - #{2.days.from_now}")
    Ride.create!(
      employee_id: employee.id,
      bike_id: bike.id,
      starts_ends: period
    )
    expect( Bike.first_available_for_time(period) ).to be_nil
  end

end
