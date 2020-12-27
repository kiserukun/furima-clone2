FactoryBot.define do
  factory :user_order do
    post_code      { '234-3333' }
    ship_form_id   { 2 }
    city           { '香港' }
    address        { '北京' }
    phone_number   { '09876543210' }
    token          { 'eyt_gfhgjrf87804768037067750877689' }
    user_id        { 2 }
    item_id        { 2 }
  end
end
