class AddKeyFieldToHalls < ActiveRecord::Migration
  def change
    add_column :halls, :key, :string, :unique => true
  end
end
