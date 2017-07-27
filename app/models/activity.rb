class Activity < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :schedules, dependent: :destroy
  has_many :places, -> { distinct }, through: :schedules

  accepts_nested_attributes_for :schedules, allow_destroy: true, reject_if: ->(attributes) { attributes['place_id'].blank? }

  def start_date
    schedules.pluck(:start_date).compact.sort.first
  end

  def end_date
    schedules.pluck(:end_date).compact.sort.last
  end
  default_scope { order('created_at desc') }
  validates :user, presence: true
  validates :description, presence: true

  acts_as_followable
  belongs_to :user
end
