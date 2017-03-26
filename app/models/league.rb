#
class League < ApplicationRecord
  validates :name, :age_min, :male, :female, :association, presence: true
  # consider dropping sport (retrievable through association)
  belongs_to :association, :sport
  validates_association :association, :sport
  has_many :games
end
