require 'rails_helper'
=begin
RSpec.describe "employees/index", type: :view do

  before do
    assign(:employees, Employee.create!(
        [ { name: 'Matiss' },
          { name: 'John' },
          { name: 'Ann' } ]
      ) )
  end

  def pagy(collection, vars={})
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", :text => "John".to_s, :count => 2
  end
end
=end
