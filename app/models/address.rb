#
class Address < ApplicationRecord
  def self.postal_code_regex
    /\A[A-Za-z]\d[A-Za-z] ?\d[A-Za-z]\d\z/i
  end
  belongs_to :province
  has_many :users
  validates_associated :province
  validates :city, :street, :street_number, presence: true
  validates :postal_code, format: { with: postal_code_regex,
                                    message: 'Invalid postal code' }
end
