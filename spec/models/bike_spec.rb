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


end
