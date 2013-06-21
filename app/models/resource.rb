class Resource < ActiveRecord::Base
  attr_accessible :type, :url, :name

  has_and_belongs_to_many :bundles
  has_and_belongs_to_many :standards
  has_one :favorite_resource
  belongs_to :mentor

end
