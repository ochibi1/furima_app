FactoryBot.define do
  
  factory :user do
    nickname                { "tarou" }
    email                   { "user@gmail.com" }
    password                { "2222222" }
    password_confirmation   { "2222222" }
    first_name              { "taro" }  
    family_name             { "tanaka" }
    first_name_kana         { "taro" }
    family_name_kana        { "tanaka" }
    birth_date              { '1995-01-01' }  
  end
  
end