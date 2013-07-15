class Bundle < ActiveRecord::Base
  attr_accessible :description, :title, :source

  has_and_belongs_to_many :resources
  has_and_belongs_to_many :standards
  belongs_to :user
  has many :favorites, :as => :favorited
  has_many :fans, :through => :favorites, :source => :user

end
