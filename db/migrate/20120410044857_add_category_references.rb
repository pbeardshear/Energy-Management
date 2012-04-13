class AddCategoryReferences < ActiveRecord::Migration
  def change
    remove_column :tips, :category_id
    
    change_table :category_tips do |ct|
      ct.references :tip
      ct.references :category
    end
  end
end
