class CreateAdminCategories < ActiveRecord::Migration
  def change
    create_table :admin_categories,options:"charset=utf8" do |t|
      t.string :name
      t.integer :weight
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
