require 'rails_helper'

RSpec.describe 'アンケート回答', type: :system do
  before do
    @admin = create(:admin)
    @user2 = create(:user2)
  end

  describe 'アンケート回答画面' do
    context 'アンケート作成画面で必要情報を入力して保存した場合' do
      it 'データが保存されること' do
        visit new_user_session_path
        fill_in "user[email]", with: 'user2@example.com'
        fill_in "user[password]", with: '000000'
        click_button 'ログイン'
        visit root_path
        click_on 'アンケート回答'
        click_button '回答する'
        expect(page).to have_content 'アンケート回答が完了しました'
      end
    end
  end
  describe 'アンケート結果画面' do
    context '管理人がアンケート結果画面に遷移した場合' do
      it 'アンケート回答が表示されること' do
        visit new_user_session_path
        fill_in "user[email]", with: 'sample@example.com'
        fill_in "user[password]", with: '000000'
        click_button 'ログイン'
        visit root_path
        click_on 'アンケート結果'
        expect(page).to have_content 'アンケート結果'
      end
    end
  end
end