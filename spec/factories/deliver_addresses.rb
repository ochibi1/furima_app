FactoryBot.define do
  
  factory :deliver_address do
    post_code                     { "1234567" }
    prefecture_code               { 1 }
    city                          { "南市" }
    house_number                  { "22番地" }
    destination_first_name        { "太郎" }
    destination_family_name       { "田中" }
    destination_first_name_kana   { "タロウ" }
    destination_family_name_kana  { "タナカ" }
  end
end