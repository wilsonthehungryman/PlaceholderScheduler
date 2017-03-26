#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :address
  #belongs_to :association
  validates_associated :address
  #validates_association :association
  validates :name, :user_name, :permission, :active, presence: true
end
