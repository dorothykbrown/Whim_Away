class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :check_in_date, null: false
      t.datetime :check_out_date, null: false
      t.integer :num_guests, null: false
      t.text :description, null: false
      t.integer :tot_price, null: false
      t.references :user, foreign_key: true
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
