class Comment < ApplicationRecord
  validates :user, presence: true
  validates :content, presence: true
  validates :commentable, presence: true
  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
