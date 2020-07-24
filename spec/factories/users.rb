FactoryBot.define do

  factory :user do
    nickname                { "tarou" }
    email  {"kk@email.com" }
    password                { "2222222" }
    password_confirmation   { "2222222" }
    first_name              { "太郎" }  
    family_name             { "田中" }
    first_name_kana         { "タロウ" }
    family_name_kana        { "タナカ" }
    birth_year              { '20200724' }  
    birth_month             { 01 }
    birth_day               { 01 }
  end

end 