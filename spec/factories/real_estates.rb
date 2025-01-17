# frozen_string_literal: true

require('faker')
include ActionDispatch::TestProcess

FactoryBot.define do
  factory :real_estate do
    name { Faker::Restaurant.name }
    rooms { Faker::Number.number(digits: 1) }
    selling { true }
    renting { true }
    sell_price { 100000 }
    rent_price { 1000 }
    showing { true }
    real_estate_type { 0 }
    description { Faker::Lorem.paragraphs(number: 3) }
    #address
    trait :with_image do
      images { [fixture_file_upload(Rails.root.join('spec', 'support', 'assets', 'house.jpg'), 'image/jpg')] }
    end
    after(:create) do |real_estate|
      real_estate.address ||= FactoryBot.build(:address, real_estate: real_estate)
    end
  end
end
