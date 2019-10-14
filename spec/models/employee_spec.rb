require 'rails_helper'

RSpec.describe Employee, type: :model do

  subject { described_class.new(name: "Matiss") }

  it "is valid with correct attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with too long name" do
    subject.name = ('a'*101)
    expect(subject).to_not be_valid
  end


end
