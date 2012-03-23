class CreateGreenFeatures < ActiveRecord::Migration
  def up
    create_table 'green_features' do |t|
      t.string 'name'
      t.text 'content'
      t.timestamps
    end
  end

  def down
    drop_table 'green_features' # deletes the whole table and all its data!
  end
end
