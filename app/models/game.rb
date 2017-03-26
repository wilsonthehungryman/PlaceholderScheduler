#
class Game < ApplicationRecord
  validates :date, presence: true
  # consider dropping sport (retrievable through association)
  belongs_to :arena, :league, :sport
  validates_association :arena, :league
end
