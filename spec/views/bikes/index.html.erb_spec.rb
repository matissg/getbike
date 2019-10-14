require 'rails_helper'
=begin
RSpec.describe "bikes/index", type: :view do
  before(:each) do
    assign(:bikes, Bike.create!(number: "number"))
  end

  it "renders a list of bikes" do
    render template: 'bikes/index.html.erb'

    assert_select 'table' do
      assert 'tr:nth-child(1)' do
        assert_select 'td:nth-child(1)', "#{@bikes.first.number}"
      end
    end

  end
end
=end
