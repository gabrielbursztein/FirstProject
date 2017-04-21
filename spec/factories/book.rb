FactoryGirl.define do
  factory :book do
    author
    title { Faker::Book.title }
    description { Faker::Lorem.paragraphs }
    year { Faker::Number.between(1700, 2017) }
    image do
      path = File.join(Rails.root, 'spec', 'files', 'oneHundred.jpg')
      Rack::Test::UploadedFile.new(path)
    end

    after(:create) do |book|
      3.times { FactoryGirl.create(:comment, book: book) }
    end
  end
end
