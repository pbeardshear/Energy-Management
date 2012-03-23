class CreateSettings < ActiveRecord::Migration
  def up
    create_table 'settings' do |t|
      t.string 'deviceID'
      t.timestamps
    end
  end

  def down
    drop_table 'settings' # deletes the whole table and all its data!
  end
end
