require 'rails_helper'
=begin
RSpec.describe "bikes/edit", type: :view do
  before(:each) do
    @bike = assign(:bike, Bike.create!(
      :number => "bike_4"
    ))
  end

  it "renders the edit bike form" do
    render 'form', bike: @bike

    assert_select "form" do

      assert_select "input[name=?]", "bike[number]"
    end
  end
end
=end
