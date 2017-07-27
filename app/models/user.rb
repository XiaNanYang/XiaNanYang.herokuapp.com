class User < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :user_comments, class_name: 'Comment'
  acts_as_followable
  acts_as_follower
  has_many :schedules, through: :activities
  has_many :destinations, -> { distinct }, through: :schedules, source: :place
  has_many :activities
  has_many :places
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
