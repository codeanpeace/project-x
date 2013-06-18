class CreateFavoriteBundles < ActiveRecord::Migration
  def change
    create_table :favorite_bundles do |t|
      t.references :mentor
      t.references :bundle

      t.timestamps
    end
    add_index :favorite_bundles, :mentor_id
    add_index :favorite_bundles, :bundle_id
  end
end
