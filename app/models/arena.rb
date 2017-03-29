#
class Arena < ApplicationRecord
  validates :name, :address, presence: true
  validates :court_identifier,
            uniqueness: { scope: :address,
                          message: 'Needs to be a unique identifier' }
  belongs_to :address
  validates_associated :address
  has_many :games
end
