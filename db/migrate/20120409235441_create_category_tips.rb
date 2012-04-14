class CreateCategoryTips < ActiveRecord::Migration
  def change
    create_table :category_tips do |t|

      t.timestamps
    end
  end
end
