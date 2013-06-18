class BundlesStandardsBridge < ActiveRecord::Migration
  def change
    create_table :bundles_standards do |t|
      t.integer :bundle_id
      t.integer :standard_id
    end
  end
end
