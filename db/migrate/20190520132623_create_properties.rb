class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :photo, null: false
      t.integer :rating
      t.string :category, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.boolean :available
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
