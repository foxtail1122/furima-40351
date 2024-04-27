FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    introduction {Faker::Lorem.sentence}
    association :user
    category_id  {2}
    fee_id         {2}
    place_id      {2}
    day_id         {2}
    condition_id        {2}
    price                 { 50000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end

  end
end
