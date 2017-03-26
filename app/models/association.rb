#
class Association < ApplicationRecord
  validates :name, :acronym, :sport, presence: true
  belongs_to :sport
  validates_association :sport
  has_many :leagues
end
