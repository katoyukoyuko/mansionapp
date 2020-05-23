require 'rails_helper'

RSpec.describe '掲示板モデル機能', type: :model do
  before do
    @user = create(:user)
  end
  it 'titleが空ならバリデーションに通らない' do
    bb = BulletinBoard.new(title: '', content: "#{Rails.root}/spec/factories/images/note1.pdf", user: @user)
    expect(bb).not_to be_valid
  end
  it 'contentが空ならバリデーションに通らない' do
    bb = BulletinBoard.new(title: 'test', content: '', user: @user)
    expect(bb).not_to be_valid
  end
  it 'userが空ならバリデーションに通らない' do
    bb = BulletinBoard.new(title: 'test', content: "#{Rails.root}/spec/factories/images/note1.pdf")
    expect(bb).not_to be_valid
  end
end
