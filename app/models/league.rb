#
class League < ApplicationRecord
  validates :name, :age_min, :male, :female, presence: true
end
