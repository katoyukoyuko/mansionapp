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

User.create!(
    name: '山田太郎',
    email: 'taro@test.com',
    password: '000000',
    password_confirmation: '000000',
    role: 'apartment_manager',
    )

20.times do |n|
name  = "example-#{n+1}"
email = "example-#{n+1}@example.com"
    
User.create!(
    name: name,
    email: email,
    password: '000000',
    password_confirmation: '000000',
    role: 'user',
    )
end

20.times do |n|
title  = "第#{n+1}回理事会議事録"
memo = "第#{n+1}回理事会の議事録を作成いたしましたので、ご確認お願いいたします。"
BulletinBoard.create!(
    title: title,
    content: open("#{Rails.root}/db/fixtures/note1.pdf"),
    memo: memo,
    user_id: 1,
    )
end