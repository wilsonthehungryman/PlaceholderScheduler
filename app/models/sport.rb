#
class Sport < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  #has_many :associations
  has_many :games
  has_many :leagues
end
