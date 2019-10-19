require 'rails_helper'

RSpec.describe Ride, type: :model do

  let(:employee) { Employee.create!(name: "Matiss") }
  let(:employee_id) { employee.id }
  let(:bike) { Bike.create!(number: "bike_1") }
  let(:bike_2) { Bike.create!(number: "bike_2") }
  let(:bike_id) { bike.id }

  subject { described_class.new(
    employee_id: employee_id, bike_id: bike_id,
    start_at: 1.day.from_now, end_at: 2.days.from_now
    ) }

  it "is valid with correct attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an employee" do
    subject.start_at = 2.days.from_now
    subject.end_at = 1.day.from_now
    expect(subject).to_not be_valid
  end

  it "is not valid without a bike" do
    subject.bike_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without start date" do
    subject.start_at = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without end date" do
    subject.end_at = nil
    expect(subject).to_not be_valid
  end

  it "is not valid if start is not in future" do
    subject.start_at = 1.day.ago
    expect(subject).to_not be_valid
  end

  it "is not valid if end date is before start date" do
    subject.start_at = 2.days.from_now
    subject.end_at = 1.day.from_now
    expect(subject).to_not be_valid
  end

  it "is not valid if employee has other ride in same time" do
    expect {
      Ride.create!([
        {employee_id: employee_id, bike_id: bike_id, start_at: 1.day.from_now, end_at: 2.days.from_now},
        {employee_id: employee_id, bike_id: bike_2.id, start_at: 30.hours.from_now, end_at: 2.days.from_now}
        ])
    }.to raise_error { |error|
      expect(error).to be_a(ActiveRecord::RecordInvalid)
    }
  end

end
