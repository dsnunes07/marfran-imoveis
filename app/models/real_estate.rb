class RealEstate < ApplicationRecord
  enum type: [:house, :apartment, :commercial, :lot]
end