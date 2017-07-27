require 'rails_helper'

RSpec.describe "activities/new", type: :view do
  before(:each) do
    sign_in(create(:user))
    assign(:activity, build(:activity))
  end

  it "renders new activity form" do
    render

    assert_select "form[action=?][method=?]", activities_path, "post" do

      assert_select "input[name=?]", "activity[user_id]"

      assert_select "textarea[name=?]", "activity[description]"
    end
  end
end
