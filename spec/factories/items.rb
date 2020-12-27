FactoryBot.define do
  factory :item do
    name           { 'あああ' }
    description    { Faker::Lorem.sentence }
    category_id    { 2 }
    fee_id         { 2 }
    ship_form_id   { 2 }
    status_id      { 2 }
    day_to_ship_id { 2 }
    price          { '11111' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
