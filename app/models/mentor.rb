class Mentor < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :user, :as => :profile
end
