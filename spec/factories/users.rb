FactoryBot.define do

  
  factory :user do
    nickname                { "tarou" }
    email                   { "user@gmail.com" }
    password                { "2222222" }
    password_confirmation   { "2222222" }
    first_name              { "太郎" }  
    family_name             { "田中" }
    first_name_kana         { "タロウ" }
    family_name_kana        { "タナカ" }
    birth_date              { '1995-01-01' }  
  end
  
end
