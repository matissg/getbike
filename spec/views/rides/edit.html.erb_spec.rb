require 'rails_helper'

RSpec.describe "rides/edit", type: :view do
  before(:each) do
    employee = Employee.create!(name: "Matiss")
    bike = Bike.create!(number: "bike_8")
    @ride = assign(:ride, Ride.create!(
      employee_id: employee.id,
      bike_id: bike.id,
      starts_ends: "#{1.day.from_now} - #{2.days.from_now}"
      ))
  end

  it "renders the edit ride form" do
    render 'form', ride: @ride

    assert_select "form[action=?][method=?]", ride_path(@ride), "post" do
    end
  end
end
