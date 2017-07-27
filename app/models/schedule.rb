class Schedule < ApplicationRecord
  validates :activity, presence: true
  validates :place, presence: true
  belongs_to :activity
  belongs_to :place
end
