class FavoriteBundle < ActiveRecord::Base
  belongs_to :mentor
  belongs_to :bundle
  # attr_accessible :title, :body
end
