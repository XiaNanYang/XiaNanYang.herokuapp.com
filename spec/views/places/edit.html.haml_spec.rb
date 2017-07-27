require 'rails_helper'

RSpec.describe "places/edit", type: :view do
  before(:each) do
    sign_in(create(:user))
    @place = assign(:place, create(:place))
  end

  it "renders the edit place form" do
    render

    assert_select "form[action=?][method=?]", place_path(@place), "post" do

      assert_select "input[name=?]", "place[user_id]"

      assert_select "input[name=?]", "place[name]"

      assert_select "textarea[name=?]", "place[description]"
    end
  end
end
