class CreateTips < ActiveRecord::Migration
  def up
    create_table 'tips' do |t|
      t.string 'title'
      t.text 'content'
      t.timestamps
    end
  end

  def down
    drop_table 'tips' # deletes the whole table and all its data!
  end
end
