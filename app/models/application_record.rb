class ApplicationRecord < ActiveRecord::Base
  scope :sample, ->(s=true) { s ? order("RANDOM()") : nil }
  self.abstract_class = true
end
