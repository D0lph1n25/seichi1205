FactoryBot.define do
  factory :seichi do
    title            {'title'}
    introduction     {'introduction'}
    category_id      {'2'}
    prefecture_id    {'2'}
    addresses        { Faker::Address.city }
    latitude         { Faker::Address.latitude }
    longitude        { Faker::Address.longitude }
    association :user 
    
    after(:build) do |seichi|
      seichi.image.attach(io: File.open('public/images/test-image.png'), filename: "test-image.png")
    end

  end
end