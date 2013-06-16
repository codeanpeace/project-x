class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :type

      t.timestamps
    end
  end
end
