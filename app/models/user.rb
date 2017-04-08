#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :address
  belongs_to :official_association
  validates_associated :address
  validates :name, :permission, presence: true

  before_create do
    # self.active = false
    self.permission = 0
    if official_association.nil?
      self.official_association = OfficialAssociation.where(name: 'none').first
    end
  end
end
