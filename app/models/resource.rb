class Resource < ActiveRecord::Base
  attr_accessible :kind, :url, :name, :source => :mentor_id

  has_and_belongs_to_many :bundles
  has_and_belongs_to_many :standards
  belongs_to :user
  has_many :favorites, :as => :favorited
  has_many :fans, :through => :favorites, :source => :user

end
