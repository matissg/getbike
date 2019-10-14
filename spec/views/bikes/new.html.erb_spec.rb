require 'rails_helper'
=begin
RSpec.describe "bikes/new", type: :view do
  before(:each) do
    assign(:bike, Bike.new(number: "MyString"))
  end

  it "renders new bike form" do
    render 'form', bike: @bike

    assert_select "form[action=?][method=?]", bikes_path, "post" do

      assert_select "input[name=?]", "bike[number]"
    end
  end
end
=end
