class AddAreaToRealEstates < ActiveRecord::Migration[6.0]
  def change
    add_column :real_estates, :area, :decimal
  end
end
