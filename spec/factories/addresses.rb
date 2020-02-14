# frozen_string_literal: true

require('faker')

FactoryBot.define do
  factory :address do
    street { Faker::Address.street_name }
    number { Faker::Address.secondary_address }
    cep { Faker::Address.zip }
    city { Faker::Address.city_prefix }
    state { Faker::Address.state }
  end
end