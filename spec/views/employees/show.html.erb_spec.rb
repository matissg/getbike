require 'rails_helper'
=begin
RSpec.describe "employees/show", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(name: "Name"))
    bike = Bike.create!(number: 'bike_10')
    @rides = assign(:rides, Ride.create!(
      employee_id: @employee.id,
      bike_id: bike.id,
      starts_ends: "#{1.day.from_now} - #{2.days.from_now}"
    ))
  end

  it "renders attributes in <p>" do
    render template: 'employees/show.html.erb', locals: { employee: @employee }
    expect(rendered).to match(/Name/)
  end
end
=end
