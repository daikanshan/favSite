class CreateAdminSites < ActiveRecord::Migration
  def change
    create_table :admin_sites,options:"charset=utf8" do |t|
      t.string :name
      t.string :url
      t.string :avatar
      t.integer :weight
      t.integer :user_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
