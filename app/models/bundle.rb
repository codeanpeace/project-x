class Bundle < ActiveRecord::Base
  attr_accessible :description, :title, :user_id

  has_and_belongs_to_many :resources
  has_and_belongs_to_many :standards
  belongs_to :user
  has_many :favorites, :as => :favorited
  has_many :fans, :through => :favorites, :source => :user

end

# we pass the subject grade and topic thru params
# and get logic to narrow that down
# display in view page as resources per standards
