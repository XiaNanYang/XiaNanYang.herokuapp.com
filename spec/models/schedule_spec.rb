require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe "#create" do

    it "should increment the count" do
      expect{ create(:schedule) }.to change{Schedule.count}.by(1)
    end

    it "should fail with invalid" do
      expect( build(:invalid_schedule) ).to be_invalid
    end

    it "should fail without :activity" do
      expect( build(:schedule, activity: nil) ).to be_invalid
    end

    it "should fail without :place" do
      expect( build(:schedule, place: nil) ).to be_invalid
    end

  end

  describe "#destroy" do

    it "should decrease the count" do
      schedule = create(:schedule)
      expect{ schedule.destroy }.to change{Schedule.count}.by(-1)
    end

    it "should decrease the count when destroy activity" do
      activity = create(:activity_with_schedules, schedules_count: 5)
      expect{ activity.destroy }.to change{Schedule.count}.by(-5)
    end

  end
end
