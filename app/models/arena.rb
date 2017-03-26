class Arena < ApplicationRecord
  validates :name, presence: true
  # validates :court_identifier,
  #           uniqueness: { scope: :address,
  #                         message: 'Needs to be a unique identifier' }
end
