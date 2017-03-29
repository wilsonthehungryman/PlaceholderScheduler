#
class SiteImage < ApplicationRecord
  validates :image, :alt, presence: true
  mount_uploader :image, AvatarUploader
end
