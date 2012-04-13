class CreateCategoryTips < ActiveRecord::Migration
  def change
    create_table :category_tips do |t|
      t.references :tip
      t.references :category
      t.timestamps
    end
  end
end
