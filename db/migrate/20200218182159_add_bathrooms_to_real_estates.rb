class AddBathroomsToRealEstates < ActiveRecord::Migration[6.0]
  def change
    add_column :real_estates, :bathrooms, :integer
  end
end
