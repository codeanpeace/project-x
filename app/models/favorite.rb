class Favorite < ActiveRecord::Base
  attr_accessible :favorited_id, :favorited_type, :user_id

  belongs_to :user
  belongs_to :favorited, :polymorphic => true

end