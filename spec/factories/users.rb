FactoryBot.define do
  factory :user do
    nickname                       {Faker::Name.initials(number: 2)}
    email                          {Faker::Internet.free_email}
    password                       {Faker::Internet.password(min_length: 6,mix_case: true)}
    password_confirmation          {password}
    family_name                    {}
    first_name                     {}
    family_name_kana               {}
    first_name_kana                {}
    birthday                       {Faker::Date.birthday(min_age: 0, max_age: 120)}
    
  end
end