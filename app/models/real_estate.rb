class RealEstate < ApplicationRecord
  has_many_attached :images
  has_one :address
  enum type: [:house, :apartment, :commercial, :lot]

  scope :showing, -> { where(showing: true) }
  scope :renting, -> { where(renting: true) }
  scope :selling, -> { where(selling: true) }
end
