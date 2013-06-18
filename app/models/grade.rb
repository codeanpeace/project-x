class Grade < ActiveRecord::Base
  attr_accessible :grade
  has_and_belongs_to_many :standards
end
