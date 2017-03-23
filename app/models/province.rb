#
class Province < ApplicationRecord
  belongs_to :country
  has_many :addresses
  validates_associated :country
  validates :name, :abbreviation, presence: true
  validates :abbreviation, uniqueness: { scope: [:name, :country] }
end
