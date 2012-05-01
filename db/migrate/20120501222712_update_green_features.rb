class UpdateGreenFeatures < ActiveRecord::Migration
  def change
    add_column :green_features, :full_name, :string
  end
end
