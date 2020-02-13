class AddRentPriceToRealEstates < ActiveRecord::Migration[6.0]
  def change
    add_column :real_estates, :rent_price, :decimal, precision: 13, scale: 2
  end
end
