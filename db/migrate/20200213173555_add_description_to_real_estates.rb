class AddDescriptionToRealEstates < ActiveRecord::Migration[6.0]
  def change
    add_column :real_estates, :description, :text
  end
end
