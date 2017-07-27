require 'rails_helper'

RSpec.describe Place, type: :model do
  describe "#create" do
    it "should increment the count" do
      expect{ create(:place) }.to change{Place.count}.by(1)
    end

  it "should fail with invalid" do
    expect( build(:invalid_place) ).to be_invalid
  end

    it "should fail without :name" do
      expect( build(:place, name: nil) ).to be_invalid
    end

    it "should fail without :user" do
      expect( build(:place, user: nil) ).to be_invalid
    end
  end

  describe "#name duplicated" do
    it "should fail with UniqueViolation" do
      expect { 2.times {create(:place, name: 'duplicate_name')} }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "followable" do
    it "can be followed by user" do
      follower = create(:user)
      followable = create(:place)
      expect{ follower.follow(followable) }.to change{Follow.count}.by(1)
      expect( follower.follow?(followable) ).to be true
    end
  end
end
