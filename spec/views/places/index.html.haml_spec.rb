require 'rails_helper'

RSpec.describe "places/index", type: :view do
  before(:each) do
    @places = assign(:places, Kaminari.paginate_array(create_list(:place, 2)).page(1))
  end

  it "renders a list of places" do
    expect(@places.size).to be(2)
    render
    @places.each do |place|
      assert_select "#places .place-name", :text => place.name.to_s, :count => 1
      assert_select "#places .place-description", :text => place.description.to_s, :count => 1
    end
  end
end
