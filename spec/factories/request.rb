FactoryGirl.define do
  factory :request do
    book
    user
    status { Faker::Number.between(0, 2) }
  end
end
