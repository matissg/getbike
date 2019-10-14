require 'rails_helper'
=begin
RSpec.describe "bikes/show", type: :view do
  before(:each) do
    @bike = assign(:bike, Bike.create!(
      number: "Number"
    ))
    @rides = @bike.rides.with_discarded.includes(:employee).references(:employees)
  end

  it "renders attributes in <p>" do
    render template: 'bikes/show.html.erb', locals: {bike: @bike}
    expect(rendered).to match(/Number/)
  end
end
=end
