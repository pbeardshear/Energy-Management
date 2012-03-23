class CreateOperationalUnits < ActiveRecord::Migration
  def up
    create_table 'operational_units' do |t|
      t.string 'name'
      t.timestamps
    end
  end

  def down
    drop_table 'operational_units' # deletes the whole table and all its data!
  end
end
