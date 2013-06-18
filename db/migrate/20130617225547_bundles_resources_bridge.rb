class BundlesResourcesBridge < ActiveRecord::Migration
  def change
    create_table :bundles_resources do |t|
      t.integer :bundle_id
      t.integer :resource_id
    end
  end
end
