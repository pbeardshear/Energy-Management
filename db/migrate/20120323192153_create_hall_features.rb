class CreateHallFeatures < ActiveRecord::Migration
  def up
    create_table 'hall_features' do |t|
      t.references :hall
      t.references :green_feature
      t.timestamps
    end
  end

  def down
    drop_table 'hall_features' # deletes the whole table and all its data!
  end
end
