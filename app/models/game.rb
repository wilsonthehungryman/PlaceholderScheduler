#
class Game < ApplicationRecord
  validates :date, presence: true
  # consider dropping sport (retrievable through association)
  belongs_to :arena
  belongs_to :league
  belongs_to :sport
  validates_associated :arena
  validates_associated :league
end
