#
class Country < ApplicationRecord
  has_many :provinces
  validates :name, :abbreviation, presence: true
  validates :abbreviation, uniqueness: { scope: :name }
end
