=begin
require 'rails_helper'

RSpec.describe "employees/index", type: :view do

  it "renders a list of employees" do
    assign(:employees, Employee.create!(name: 'John'))
    render
    expect(rendered).to match /John/
  end

end
=end
