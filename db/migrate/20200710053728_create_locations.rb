class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :country
      t.string :state
      t.string :city
      t.string :street
      t.string :address_number
      t.string :phone
      t.decimal :lat
      t.decimal :long

      t.timestamps
    end
  end
end
