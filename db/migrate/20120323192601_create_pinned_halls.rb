class CreatePinnedHalls < ActiveRecord::Migration
   def up
    create_table 'pinned_halls' do |t|
      t.references :setting
      t.references :hall
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
    drop_table 'pinned_halls' # deletes the whole table and all its data!
  end 
end
