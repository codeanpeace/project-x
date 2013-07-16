class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  has_many :bundles
  has_many :resources

  has_many :favorites
  has_many :favorite_bundles, :through => :favorites, :source => :favorited, :source_type => "Bundle"
  has_many :favorite_resources, :through => :favorites, :source => :favorited, :source_type => "Resource"

  belongs_to :profile, :polymorphic => true

end