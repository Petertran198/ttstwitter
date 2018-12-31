class TweetTag < ApplicationRecord
  belong_to :tweet
  belong_to :tag
end
