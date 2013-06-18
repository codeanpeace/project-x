class GradesStandardsBridge < ActiveRecord::Migration
  def change
    create_table :grades_standards do |t|
      t.integer :grade_id
      t.integer :standard_id
    end
  end
end
