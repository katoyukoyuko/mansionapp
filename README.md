# README

## バージョン情報
- Ruby 2.6.5
- Ruby on Rails 5.2.4

## カタログ設計 / 機能一覧 / テーブル定義書
https://docs.google.com/spreadsheets/d/1inVnZd4sx_dVmfDeNw229Xr2NrRQCSqEil4Km5pxIyk/edit?usp=sharing

## ER図
https://gyazo.com/5cc99c836536ffec0f2bc9d0e7e9ffab

## 画面遷移図 / ワイヤーフレーム
https://gyazo.com/a341e97a87b7853fbd486c9132c228be

## 使用予定Gem
- devise (ログイン機能)
- Kamakiri (ページネーション実装)
- spec-rails (Rspec) ...etc

## アプリの使い方
- アプリダウンロード後は、rails db:seed を行い、以下のアカウントでログインして触ってみてください 
- email: 'hanako@test.com'
- password: '000000'
- ※ 本アプリは、ユーザーの新規登録は権限(role)が理事長(chairman)か管理人(apartment_manager)のみ行えます。
　　 上記のseedデータにある、テストアカウントでログイン後、ユーザー新規登録を行ってください。