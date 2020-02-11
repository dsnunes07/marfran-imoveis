class RealEstate < ApplicationRecord
  has_many_attached :images
  enum type: [:house, :apartment, :commercial, :lot]
end