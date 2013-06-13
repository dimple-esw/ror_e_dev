class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  has_many :tweets  
  has_many :user_profiles

def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["info"]["name"]
    user.profile_image = auth['info']['image'] 
    user.oauth_token = auth.credentials.token
    user.oauth_secret = auth.credentials.secret

  end
end


def twitter
  @twitter ||= Twitter::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_secret)
end




end
