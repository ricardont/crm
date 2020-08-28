class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date_time
      t.integer :duration
      t.integer :user_id
      t.integer :customer_id
      t.integer :location_id
      t.integer :product_id

      t.timestamps
    end
  end
end
