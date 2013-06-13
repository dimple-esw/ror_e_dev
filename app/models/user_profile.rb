class UserProfile < ActiveRecord::Base
   attr_accessible :profile_image_url,:user_id,:image_url
   belongs_to :user
end
