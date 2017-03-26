#
class Game < ApplicationRecord
  validates :date, presence: true
  # consider dropping sport (retrievable through association)
  belongs_to :arena
  belongs_to :league
  belongs_to :sport
  validates_association :arena
  validates_association :league
end
