class AddAdminTable < ActiveRecord::Migration
  def change
    create_table :admins do |t|
    end
  end
end
