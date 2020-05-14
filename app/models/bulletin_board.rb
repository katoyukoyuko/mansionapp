class BulletinBoard < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true

  mount_uploader :content, ImageUploader
end
