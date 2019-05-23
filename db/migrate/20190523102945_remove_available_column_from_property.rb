class RemoveAvailableColumnFromProperty < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :available, :boolean
  end
end
