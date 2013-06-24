class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :kind
      t.string :url
      t.string :name
      t.string :source

      t.timestamps
    end
  end
end
