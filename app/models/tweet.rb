class Tweet < ActiveRecord::Base
 require 'rubygems'
 require 'twitter'

 attr_accessible :from_user, :from_user_id_str, :profile_image_url, :text, :twitter_created_at,:user_id
 belongs_to :user
 
 #var twimg = /twimg.com\/([a-z-A-Z0-9]*).jpg/
 #tweet.entities.media[i].media_url



    #A method to grab latest tweets from Twitter
  def self.get_latest_tweets(user_id)

     @user= User.find(user_id)
    @twitter=  @user.twitter.home_timeline()
   # @twitter =  Twitter.home_timeline(:count => 10)
     @twitter.each do |tweet_results|

     #finally creating the tweet record
      unless Tweet.exists?(['twitter_created_at = ? AND from_user_id_str = ?',tweet_results.created_at.to_datetime, tweet_results.id.to_s])

      linked = tweet_results.text.gsub( %r{http://[^\s<]+} ) do |url|
     
      # linked = tweet_results.text.gsub( %r{pic.twitter.com/+} ) do |url|
      if  url
      if tweet_results.media[0]
          UserProfile.create!({
         :profile_image_url => tweet_results.profile_image_url,
         :image_url => tweet_results.media[0].media_url ,
         :user_id => user_id
       })
      
      end
     
       Tweet.create!({
        :from_user => tweet_results.from_user,
        :from_user_id_str => tweet_results.id,
        :profile_image_url => tweet_results.profile_image_url,
        :text => tweet_results.text,
        :twitter_created_at => tweet_results.created_at.to_datetime,
        #:user_name => tweet_results.auth["info"]["from_user"]
         :user_id => user_id
       })
       end
      end
    end
   end #unless end
   end
end
