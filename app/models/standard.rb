class Standard < ActiveRecord::Base
  attr_accessible :description, :grade, :standard, :subject, :topic

  has_and_belongs_to_many :resources
  has_and_belongs_to_many :bundles
  has_and_belongs_to_many :grades

end
