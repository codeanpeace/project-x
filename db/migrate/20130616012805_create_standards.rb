class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.string :subject
      t.string :grade
      t.string :topic
      t.string :standard
      t.text :description

      t.timestamps
    end
  end
end
