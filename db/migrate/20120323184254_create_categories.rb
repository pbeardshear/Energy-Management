class CreateCategories < ActiveRecord::Migration
  def up
    create_table 'categories' do |t|
      t.string 'name'
      t.timestamps
    end
  end

  def down
    drop_table 'categories' # deletes the whole table and all its data!
  end

end
