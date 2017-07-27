require 'rails_helper'

RSpec.describe "activities/edit", type: :view do
  before(:each) do
    sign_in(create(:user))
    @activity = assign(:activity, create(:activity))
  end

  it "renders the edit activity form" do
    render

    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do

      assert_select "input[name=?]", "activity[user_id]"

      assert_select "textarea[name=?]", "activity[description]"
    end
  end
end
