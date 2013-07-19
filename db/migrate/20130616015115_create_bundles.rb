class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
