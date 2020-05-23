require 'rails_helper'

RSpec.describe 'ユーザー機能', type: :system do
  before do
    admin = create(:admin)
    user = create(:user)
  end

  describe 'ユーザー登録画面' do
    context 'ログイン後、管理画面からユーザー作成に必要項目を入力して、保存ボタンを押した場合' do
      it 'データが保存されること' do
        visit new_user_session_path
        fill_in "user[email]", with: 'sample@example.com'
        fill_in "user[password]", with: '000000'
        click_button 'ログイン'
        visit root_path
        click_button '管理画面'
        click_on '新規作成', match: :first
        fill_in "user[name]", with: 'test'
        fill_in "user[email]", with: 'test@test.com'
        fill_in "user[password]", with: '123456'
        fill_in "user[password_confirmation]", with: '123456'
        find(".ra-filtering-select-input").set("user")
        fill_in "user[confirmed_at]", with: Time.now
        click_button '保存'
        expect(page).to have_content 'ユーザーの作成に成功しました'
      end
    end
  end

  describe 'ユーザー画面' do
    context 'ログインページで必要な情報を入力後、ログインボタンを押した場合' do
      it 'マイページに遷移すること' do
        visit new_user_session_path
        fill_in "user[email]", with: 'sample@example.com'
        fill_in "user[password]", with: '000000'
        click_button 'ログイン'
        expect(page).to have_content 'マイページ'
      end
    end
    context 'ログインページで必要な情報を入力後、ログインボタンを押した場合' do
      it 'ログインできること' do
        visit new_user_session_path
        fill_in "user[email]", with: 'sample@example.com'
        fill_in "user[password]", with: '000000'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end
    end
    context 'マイページログアウトボタンを押した場合' do
      it 'ログアウトできること' do
        visit new_user_session_path
        fill_in "user[email]", with: 'sample@example.com'
        fill_in "user[password]", with: '000000'
        click_button 'ログイン'
        click_on 'ログアウト'
        expect(page).to have_content 'アカウント登録もしくはログインしてください。'
      end
    end
    context 'ログイン後、マイページの「編集」ボタンからユーザー編集し、更新ボタンを押した場合' do
      it 'データが保存されること' do
        visit new_user_session_path
        fill_in "user[email]", with: 'sample@example.com'
        fill_in "user[password]", with: '000000'
        click_button 'ログイン'
        click_on '編集'
        fill_in "user[name]", with: 'testtest'
        fill_in "user[name_ruby]", with: 'てすとてすと'
        fill_in "user[current_password]", with: '000000'
        attach_file 'user[icon]', "#{Rails.root}/spec/factories/images/images.png"
        click_button '更新'
        expect(page).to have_content 'アカウント情報を変更しました。'
      end
    end
  end

  describe 'ユーザー削除' do
    context 'ユーザー管理画面から理事長がユーザー削除を行った場合' do
      it 'ユーザー削除ができること' do
        visit new_user_session_path
        fill_in "user[email]", with: 'sample@example.com'
        fill_in "user[password]", with: '000000'
        click_button 'ログイン'
        visit root_path
        click_button '管理画面'
        click_on 'ユーザー', match: :first
        click_on '削除', match: :first
        click_on '実行する'
        expect(page).to have_content 'ユーザーの削除に成功しました'
      end
    end
    context '理事長か管理人が1名の時に、当該ユーザー削除をした場合' do
      it 'ユーザー削除ができないこと' do
        visit new_user_session_path
        fill_in "user[email]", with: 'sample@example.com'
        fill_in "user[password]", with: '000000'
        click_button 'ログイン'
        visit root_path
        click_button '管理画面'
        click_on 'ユーザー', match: :first
        click_on '削除', match: :first
        click_on '実行する'
        click_on '削除', match: :first
        click_on '実行する'
        expect(page).to have_content 'ユーザーの削除に失敗しました'
      end
    end
  end
end