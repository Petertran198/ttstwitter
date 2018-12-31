class Tweet < ApplicationRecord
  belongs_to :user
  validates :message, presence: true
  validates :message, length: {maximum: 140, too_long: "A tweet can only be 140 characters"}
  has_many :tweet_tags
  has_many :tags, through: :tweet_tags

end
