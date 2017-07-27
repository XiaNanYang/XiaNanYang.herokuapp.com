require 'rails_helper'

RSpec.describe "activities/index", type: :view do
  before(:each) do
    @activities = assign(:activities, Kaminari.paginate_array(create_list(:activity, 2)).page(1))
  end

  it "renders a list of activities" do
    expect(@activities.size).to be(2)
    render
    @activities.each do |activity|
      assert_select "#activities .activity-description", :text => activity.description.to_s, :count => 1
    end
  end
end
