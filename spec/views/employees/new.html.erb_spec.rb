=begin
require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  it "renders new employee form" do
    employee = Employee.new(name: 'John')
    render 'form', locals: {employee: employee}

    render
    expect(rendered).to match /New Employee/
  end
end
=end
