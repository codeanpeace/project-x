class CreateFavoriteResources < ActiveRecord::Migration
  def change
    create_table :favorite_resources do |t|
      t.references :mentor
      t.references :resource

      t.timestamps
    end
    add_index :favorite_resources, :mentor_id
    add_index :favorite_resources, :resource_id
  end
end
