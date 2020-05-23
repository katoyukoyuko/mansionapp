require 'rails_helper'

RSpec.describe 'ユーザー機能', type: :system do
  before do
    @admin = create(:admin)
  end

  describe '掲示板登録画面' do
    context 'ログイン後、掲示板登録画面に遷移し、保存ボタンを押した場合' do
      it 'データが保存されること' do
        visit new_user_session_path
        fill_in "user[email]", with: 'sample@example.com'
        fill_in "user[password]", with: '000000'
        click_button 'ログイン'
        visit root_path
        click_on '掲示板一覧'
        click_on '掲示板登録'
        fill_in "bulletin_board[title]", with: 'test'
        attach_file 'bulletin_board[content]', "#{Rails.root}/spec/factories/images/note1.pdf"
        click_button '掲示板登録'
        expect(page).to have_content '掲示板を作成しました'
      end
    end
    context '掲示板管理画面に遷移し、編集後、保存ボタンを押した場合' do
      it 'データが更新されること' do
        visit new_user_session_path
        fill_in "user[email]", with: 'sample@example.com'
        fill_in "user[password]", with: '000000'
        click_button 'ログイン'
        visit root_path
        click_on '掲示板一覧'
        click_on '掲示板登録'
        fill_in "bulletin_board[title]", with: 'test'
        attach_file 'bulletin_board[content]', "#{Rails.root}/spec/factories/images/note1.pdf"
        click_button '掲示板登録'
        visit root_path
        sleep 1
        click_button '管理画面'
        sleep 1
        click_on '掲示板', match: :first
        sleep 1
        click_on '編集', match: :first
        fill_in "bulletin_board[title]", with: 'test1111'
        click_button '保存'
        expect(page).to have_content '掲示板の更新に成功しました'
      end
    end
    context '掲示板管理画面に遷移し、削除ボタンを押した場合' do
      it 'データが削除されること' do
        visit new_user_session_path
        fill_in "user[email]", with: 'sample@example.com'
        fill_in "user[password]", with: '000000'
        click_button 'ログイン'
        visit root_path
        click_on '掲示板一覧'
        click_on '掲示板登録'
        fill_in "bulletin_board[title]", with: 'test'
        attach_file 'bulletin_board[content]', "#{Rails.root}/spec/factories/images/note1.pdf"
        click_button '掲示板登録'
        visit root_path
        sleep 1
        click_button '管理画面'
        sleep 1
        click_on '掲示板', match: :first
        sleep 1
        click_on '削除', match: :first
        click_button '実行'
        expect(page).to have_content '掲示板の削除に成功しました'
      end
    end
    context '掲示板一覧ボタンを場合' do
      it '掲示板一覧が表示されること' do
        visit new_user_session_path
        fill_in "user[email]", with: 'sample@example.com'
        fill_in "user[password]", with: '000000'
        click_button 'ログイン'
        visit root_path
        click_on '掲示板一覧'
        expect(page).to have_content '掲示板'
      end
    end
    context '掲示板のタイトルをクリック場合' do
      it '当該掲示板の詳細が表示されること' do
        visit new_user_session_path
        fill_in "user[email]", with: 'sample@example.com'
        fill_in "user[password]", with: '000000'
        click_button 'ログイン'
        visit root_path
        click_on '掲示板一覧'
        click_on '掲示板登録'
        fill_in "bulletin_board[title]", with: 'test'
        attach_file 'bulletin_board[content]', "#{Rails.root}/spec/factories/images/note1.pdf"
        click_button '掲示板登録'
        visit root_path
        sleep 1
        click_on '掲示板一覧'
        sleep 1
        click_on 'test'
        expect(page).to have_content 'test'
      end
    end
  end
end