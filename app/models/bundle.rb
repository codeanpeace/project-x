class Bundle < ActiveRecord::Base
  attr_accessible :description, :title

  has_and_belongs_to_many :resources
  has_and_belongs_to_many :standards
  has_one :favorite_bundle
  belongs_to :mentor

end
