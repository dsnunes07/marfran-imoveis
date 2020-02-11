class CreateRealEstates < ActiveRecord::Migration[6.0]
  def change
    create_table :real_estates do |t|
      t.integer :real_estate_type, null: false
      t.string :name, null: false
      t.integer :rooms
      t.boolean :showing, null: false, default: true
    end
  end
end
