class BulletinBoard < ApplicationRecord
  before_update :update_action
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true

  mount_uploader :content, ImageUploader

  def update_action
    # user.roleが"chairman"のみアップデートできるようにする
    if user.role != "chairman"
      errors.add(:user, 'ユーザーの種別は「理事長」である必要があります。')
      throw :abort
    end
  end

end
