class CreateDeviceCategories < ActiveRecord::Migration
  def up
    create_table 'device_categories' do |t|
      t.references :setting
      t.references :category
      t.timestamps
    end
  end

  def down
    drop_table 'device_categories' # deletes the whole table and all its data!
  end
end
