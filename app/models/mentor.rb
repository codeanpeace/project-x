class Mentor < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  has_many :favorite_bundles
  has_many :favorite_resources
  has_many :bundles
  has_many :resources

end
