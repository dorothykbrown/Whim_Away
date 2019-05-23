class AddAvailabilityColumnToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :availability, :string
  end
end
