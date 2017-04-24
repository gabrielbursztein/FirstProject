FactoryGirl.define do
  factory :comment do
    user
    rate { Faker::Number.between(1, 5) }
    description { Faker::Lorem.sentence }
    book
  end
end
