class Favorite < ActiveRecord::Base
  attr_accessible :favorited_id, :favorited_type, :mentor_id

  belongs_to :mentor
  belongs_to :favorited, :polymorphic => true

end