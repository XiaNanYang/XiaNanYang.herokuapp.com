require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "should increment the count" do
    expect{ create(:comment) }.to change{Comment.count}.by(1)
  end

  it "should fail with bare comment" do
    expect( build(:bare_comment) ).to be_invalid
  end

  it "should fail with invalid" do
    expect( build(:invalid_comment) ).to be_invalid
  end

  it "should fail without :user" do
    expect( build(:comment, user: nil) ).to be_invalid
  end

  it "should fail without :content" do
    expect( build(:comment, content: nil) ).to be_invalid
  end

  it "should fail without :commentable" do
    expect( build(:comment, commentable: nil) ).to be_invalid
  end

  it "should have :commentable_id" do
    expect( create(:comment).commentable ).not_to be(nil)
  end
end
