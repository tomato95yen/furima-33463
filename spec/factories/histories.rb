FactoryBot.define do
  factory :history do
    postal_code { '111-1111' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '横浜市緑区' }
    block { '青山1-1-1' }
    building_name { '柳ビル103' }
    phone_number { Faker::PhoneNumber.subscriber_number('00000000000') }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end
