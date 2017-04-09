#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :address
  belongs_to :official_association
  validates_associated :address

  validates :name, presence: true
  validates :active, :permission, :association_fees_paid,
            presence: true, on: :update

  def not_set(field)
    field.nil? || field.empty?
  end

  before_create do
    self.official_association ||= OfficialAssociation.find_by(name: 'none')
    self.permission             = 0 if not_set games_reffed
    self.active                 = false if active.nil?
    self.association_fees_paid  = false if association_fees_paid.nil?
    self.games_reffed           = 0 if not_set games_reffed
    self.games_cancelled        = 0 if not_set games_cancelled
    self.games_missed           = 0 if not_set games_missed
  end
end
