class RealEstate < ApplicationRecord
  has_many_attached :images
  has_one :address
  enum type: [:house, :apartment, :commercial, :lot]
end