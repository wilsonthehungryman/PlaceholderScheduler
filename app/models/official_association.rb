#
class OfficialAssociation < ApplicationRecord
  validates :name, :acronym, :sport, presence: true
  belongs_to :sport
  validates_associated :sport
  has_many :leagues
  has_many :users
end
