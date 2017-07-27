class Place < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :schedules, dependent: :destroy
  has_many :activities, -> { distinct }, through: :schedules
  validates :user, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :q, ->(query_string) { query_string.nil? ? nil : where("name LIKE ?", "%#{query_string}%") }

  acts_as_followable
  belongs_to :user
end
