# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
    name: '日本花子',
    email: 'hanako@test.com',
    password: '000000',
    password_confirmation: '000000',
    role: 'chairman',
    )

BulletinBoard.create!(
    title: '第1回理事会議事録',
    content: open("#{Rails.root}/db/fixtures/note1.pdf"),
    memo: '2020年4月15日に開催した第1回理事会の議事録を作成いたしましたので、ご確認お願いいたします。',
    user_id: 1,
    )