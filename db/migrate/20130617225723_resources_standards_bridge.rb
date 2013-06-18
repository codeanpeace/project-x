class ResourcesStandardsBridge < ActiveRecord::Migration
  def change
    create_table :resources_standards do |t|
      t.integer :resource_id
      t.integer :standard_id
    end
  end
end
