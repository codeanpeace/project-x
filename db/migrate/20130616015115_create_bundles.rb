class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
