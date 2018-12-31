class EpicenterController < ApplicationController
  def feed
    @following_tweets = []

    Tweet.all.each do |tweet|
      if current_user.following.include?(tweet.user_id) || current_user.id == tweet.user_id 
        @following_tweets.push(tweet)
      end
    end
  end

  def show_user
    @user = User.find(params[:id])
  end

  def now_following
  end

  def unfollow
  end
end
