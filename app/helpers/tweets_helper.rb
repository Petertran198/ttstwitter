module TweetsHelper
  def get_tagged(tweet)
    message_arr = tweet.message.split

    message_arr.each_with_index do |word, index|
      if word[0] == '#'
        if Tag.pluck(:phrase).include?(word.downcase) ## if the hash tag is included
          tag = Tag.find_by(phrase: word.downcase) ## find the phrase and store it in tag 
        else ## tag doesnt exist
          tag = Tag.create(phrase: word.downcase) ## create the hashtag and store it in tag
        end
        tweet_tag = TweetTag.create(tweet_id: @tweet.id, tag_id: tag.id) ## store the tag in the Tweet_tag table 

        message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
      end
    end
    
    final_message = message_arr.join(" ")
    tweet.message = final_message
    return tweet
  end
end
