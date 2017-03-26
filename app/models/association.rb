#
class Association < ApplicationRecord
  validates :name, :acronym, presence: true
end
