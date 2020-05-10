class User < ApplicationRecord
  before_destroy :destroy_action
  before_update :update_action
  enum role: [:user, :apartment_manager, :chairman]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :validatable, :confirmable

  mount_uploader :icon, ImageUploader

  private

  def destroy_action
    # 最後の1管理者の場合は削除できない。(管理人か理事長の数が1以下になってはいけない)
    if User.where(role: "chairman").count + User.where(role: "apartment_manager").count == 1
      user = User.where(role: "chairman").or(User.where(role: "apartment_manager"))
      if user[0] == self
      throw :abort
      end
    end
  end

  def update_action
    # 最後の1管理者の場合は管理者をfalseに変更できない。(admin:trueの数が1以下になってはいけないので、admin trueが1人の時のupdateの時に、admin falseにできてないけない)
    if User.where(role: "chairman").count + User.where(role: "apartment_manager").count == 1 && self.role == "user"
      user = User.where(role: "chairman").or(User.where(role: "apartment_manager"))
      if user[0] == self
        errors.add(:user, '現在あなたのみが管理人のため管理人から外れることはできません。')
        throw :abort
      end
    end
  end
end
