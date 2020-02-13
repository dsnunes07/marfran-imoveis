class AddSellingRentingToRealEstates < ActiveRecord::Migration[6.0]
  def change
    add_column :real_estates, :selling, :boolean, default: false, null: false
    add_column :real_estates, :renting, :boolean, default: false, null: false
  end
end
