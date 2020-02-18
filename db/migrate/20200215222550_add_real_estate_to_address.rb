class AddRealEstateToAddress < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :real_estate
  end
end
