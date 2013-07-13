class Bundle < ActiveRecord::Base
  attr_accessible :description, :title

  has_and_belongs_to_many :resources
  has_and_belongs_to_many :standards
  belongs_to :mentor
  has many :favorites, :as => :favorited
  has_many :fans, :through => :favorites, :source => :mentor

end
