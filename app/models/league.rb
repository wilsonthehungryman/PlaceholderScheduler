#
class League < ApplicationRecord
  validates :name, :age_min, :male, :female, presence: true
  # consider dropping sport (retrievable through association)
  belongs_to :official_association
  belongs_to :sport
  validates_associated :official_association
  validates_associated :sport
  has_many :games
end
