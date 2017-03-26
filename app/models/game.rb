#
class Game < ApplicationRecord
  validates :date, presence: true
end
