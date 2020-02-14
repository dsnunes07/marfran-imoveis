class AddTimestampsToRealEstates < ActiveRecord::Migration[6.0]
  def change
    add_column :real_estates, :created_at, :datetime, null: false, default: Time.now()
    add_column :real_estates, :updated_at, :datetime, null: false, default: Time.now()
  end
end
