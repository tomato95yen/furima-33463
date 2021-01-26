FactoryBot.define do
  factory :history do
    postal_code { 111-1111 }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { "横浜市緑区" }
    block { "青山1-1-1" }
    building { "柳ビル103" }
    phone_number { Faker::PhoneNumber.subscriber_number(length: 11) }
    token { "tok_abcdefghijk00000000000000000" }
    user_id { "" }
    item_id { "" }

  end
end
