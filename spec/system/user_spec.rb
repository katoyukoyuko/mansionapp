require 'rails_helper'

RSpec.describe 'ユーザー機能', type: :system do
  before do
    # login_admin
    login_user
    # sign_in FactoryBot.create(:user)
    # click_button 'メールアドレスの確認'
    # sign_in user
    # @user2 = FactoryBot.create(:user2)
    # FactoryBot.create(:user3)
  end

  describe 'ユーザー登録画面' do
    context '必要項目を入力して、保存ボタンを押した場合' do
      it 'データが保存されること' do
        visit dashboard_path
        click_button 'ユーザー'
        click_button '新規作成'
        fill_in "user[name]", with: 'test'
        fill_in "user[email]", with: 'test@test.com'
        fill_in "user[password]", with: '123456'
        fill_in "user[password_confirmation]", with: '123456'
        select "user", from: 'user[role]'
        # 「登録」というvalue（表記文字）のあるボタンをclick_onする（クリックする）
        click_button '保存'
        # clickで登録されたはずの情報が、ユーザー詳細ページに表示されているかを確認する
        expect(page).to have_content 'ユーザーの作成に成功しました'
      end
    end
  end
end