class AddAddressToRealEstate < ActiveRecord::Migration[6.0]
  def change
    add_reference :real_estates, :address
  end
end
