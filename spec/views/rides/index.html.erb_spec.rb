require 'rails_helper'
=begin
RSpec.describe "rides/index", type: :view do
  before(:each) do
    employee = Employee.create!(name: "Name")
    bike = Bike.create!(number: 'bike_10')
    assign(:rides, [
      Ride.create!(
        employee_id: employee.id,
        bike_id: bike.id,
        starts_ends: "#{1.day.from_now} - #{2.days.from_now}"
      ),
      Ride.create!(
        employee_id: employee.id,
        bike_id: bike.id,
        starts_ends: "#{3.day.from_now} - #{4.days.from_now}"
      ),
    ])
  end

  it "renders a list of rides" do
    render template: 'rides/index.html.erb'
  end
end
=end
