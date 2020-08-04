FactoryBot.define do
  factory :product do

    name               {"太朗の人形"}
    introduction       {"最高です"}
    size_id            {1}
    brand_id           {1}
    condition_id       {1}
    postage_payer_id   {1}
    prefecture_code    {1}
    prep_date_id       {1}
    price              {1000}
    trading_status     {1}
    closed_deal_date   {"2020-08-01"}
    seller_id          {1}
    buyer_id           {1}
    category
  
    # after(:build) do |product|
    #   product.product_imgs << FactoryBot.build(:product_img)
    # end


  end 
end
