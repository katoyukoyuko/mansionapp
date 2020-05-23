require 'rails_helper'

RSpec.describe 'ユーザーモデル機能', type: :model do
  it 'nameが空ならバリデーションに通らない' do
    user = User.new(name: '', email: 'test@email.com', password: '000000', role: 'user')
    expect(user).not_to be_valid
  end
  it 'emailが空ならバリデーションに通らない' do
    user = User.new(name: 'test', email: '', password: '000000', role: 'user')
    expect(user).not_to be_valid
  end
  it 'roleが空ならバリデーションに通らない' do
    user = User.new(name: 'test', email: '', password: '000000', role: '')
    expect(user).not_to be_valid
  end
end