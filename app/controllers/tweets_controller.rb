class TweetsController < ApplicationController
#  before_filter :get_tweets
  layout 'site'
  require 'rubygems'
  require 'twitter'
  def index
    @tweets = Tweet.find(:all,:conditions=>["user_id =?",current_user.id],:order =>"twitter_created_at desc",:limit => 10)
  end

  def new
  end

  def create
  end
   
  def get_tweets

    Tweet.get_latest_tweets(current_user.id)
    respond_to do |format|
      format.html { redirect_to tweets_index_path }
      format.json { head :no_content }
    end
   
  end

  def get_list_of_connected_users
   @tweets = Tweet.paginate(:conditions=>["user_id =?",current_user.id],:page => params[:page], :per_page => 5)
  end

  def user_profile
   @user_photos = UserProfile.find(:all,:conditions=>["user_id =?",current_user.id],:limit => 10,:order =>"created_at desc")
  end

 def vote_image
 
  @photo =  UserProfile.find_by_id(params[:photo_id])
  if @photo.vote != nil
     @photo.vote =  @photo.vote.to_i + 1 
  else
    @photo.vote = "1"
  end
  if @photo.save!
  
     if  request.xhr?
        render :partial => 'vote_image' 
     
     end
  end
  
  # respond_to do |format|
   #   format.html { redirect_to user_profile_path }
   #   format.json { head :no_content }
   # end

 end

 def view_most_voted_page
     @user_photos = UserProfile.find(:all,:conditions=>["user_id =?",current_user.id],:order => "vote desc")
 end 

end
