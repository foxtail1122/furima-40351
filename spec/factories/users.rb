FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.email }
    password { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name   { 'やマ田' }
    first_name  { '太ろウ' }
    last_name_reading  { 'ヤマダ' }
    first_name_reading { 'タロウ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2024-12-31') }
  end
end
