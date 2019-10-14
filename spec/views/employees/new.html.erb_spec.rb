require 'rails_helper'
=begin
RSpec.describe "employees/new", type: :view do
  before(:each) do
    assign(:employee, Employee.new(
      :name => "MyString"
    ))
  end

  it "renders new employee form" do
    render 'form', employee: @employee

    assert_select "form" do

      assert_select "input[name=?]", "employee[name]"
    end
  end
end
=end
