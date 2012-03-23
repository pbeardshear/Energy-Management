class CreateHalls < ActiveRecord::Migration
  def up
    create_table 'halls' do |t|
      t.string 'name'
      t.timestamps
    end
  end

  def down
    drop_table 'halls' # deletes the whole table and all its data!
  end
end
