class FavoriteResource < ActiveRecord::Base

  belongs_to :mentor
  belongs_to :resource
  # attr_accessible :title, :body
end
