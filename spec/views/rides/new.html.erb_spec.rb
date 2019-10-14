require 'rails_helper'
=begin
RSpec.describe "rides/new", type: :view do
  before(:each) do
    employee = Employee.create!(name: "Matiss")
    bike = Bike.create!(number: "bike_8")
    @ride = assign(:ride, Ride.create!(
      employee_id: employee.id,
      bike_id: bike.id,
      starts_ends: "#{1.day.from_now} - #{2.days.from_now}"
      ))
  end

  it "renders new ride form" do
    render 'form', ride: @ride

    assert_select "form[action=?][method=?]", rides_path, "post" do

      assert_select "input[name=?]", "ride[starts_ends]"
    end
  end

end
=end
