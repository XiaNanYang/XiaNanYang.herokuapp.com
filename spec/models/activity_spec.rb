require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe "#create" do
    it "should increment the count" do
      expect{ create(:activity) }.to change{Activity.count}.by(1)
    end

    it "should increment the count with schedules" do
      expect{ create(:activity_with_schedules) }.to change{Activity.count}.by(1)
      expect{ create(:activity_with_schedules, schedules_count: 5) }.to change{Schedule.count}.by(5)
    end

    it "should fail with invalid" do
      expect( build(:invalid_activity) ).to be_invalid
    end

    it "should fail without :description" do
      expect( build(:activity, description: nil) ).to be_invalid
    end

    it "should fail without :user" do
      expect( build(:activity, user: nil) ).to be_invalid
    end
  end

  describe "followable" do
    it "can be followed by user" do
      follower = create(:user)
      followable = create(:activity)
      expect{ follower.follow(followable) }.to change{Follow.count}.by(1)
      expect( follower.follow?(followable) ).to be true
    end
  end
end
