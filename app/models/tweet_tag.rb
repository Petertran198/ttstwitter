class TweetTag < ApplicationRecord
  belongs_to :tweet
  belongs_to :tag
end
