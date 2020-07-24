FactoryBot.define do
  
  factory :user do
    nickname                { "tarou" }
    email                   { "user.email" }
    password                { "2222222" }
    password_confirmation   { "2222222" }
    first_name              { "taro" }  
    family_name             { "tanaka" }
    first_name_kana         { "taro" }
    family_name_kana        { "tanaka" }
    birth_year              { "1990" }  
    birth_month             { "01" }
    birth_day               { "01" }
  end
  
end