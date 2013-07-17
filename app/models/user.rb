class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :username, :last_login_at, :last_logout_at, :last_activity_at

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :bundles
  has_many :resources

  has_many :favorites
  has_many :favorite_bundles, :through => :favorites, :source => :favorited, :source_type => "Bundle"
  has_many :favorite_resources, :through => :favorites, :source => :favorited, :source_type => "Resource"

  belongs_to :profile, :polymorphic => true

end