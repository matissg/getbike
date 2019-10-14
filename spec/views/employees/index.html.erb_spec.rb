require 'rails_helper'
=begin
RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        :name => "Name"
      ),
      Employee.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
=end
