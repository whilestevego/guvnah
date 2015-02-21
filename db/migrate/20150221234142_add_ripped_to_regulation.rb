class AddRippedToRegulation < ActiveRecord::Migration
  def change
    add_column :regulations, :ripped, :bool
  end
end
