class AddReferences < ActiveRecord::Migration
  def change
    change_table :tips do |t|
      t.references :category
    end
    change_table :halls do |t|
      t.references :operational_unit
    end
  end
end
