FactoryBot.define do
  factory :bulletin_board ,class: BulletinBoard do
    title { 'sample' }
    content { "#{Rails.root}/spec/factories/images/note1.pdf" }
    memo { 'sample' }
  end
end
