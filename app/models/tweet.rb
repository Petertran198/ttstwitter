class Tweet < ApplicationRecord
  belongs_to :user
  validates :message, presence: true
  validates :message, length: {maximum: 140, too_long: "A tweet can only be 140 characters"}, on: :create
  has_many :tweet_tags
  has_many :tags, through: :tweet_tags
  before_validation :link_check, on: :create
  after_validation :apply_link, on: :create



## Does this before creating the tweet , it finds a link, if there is one, and throws the link in the database and cut it down to 20 characters
  def link_check 
    check = false
    if self.message.include?("http://") || self.message.include?("https://")
      check = true
    end
    if check == true 
      arr = self.message.split
      index = arr.map { |word| word.include?("http")}.index(true)
      self.link = arr[index]
      if arr[index].length > 23
        arr[index] = "#{arr[index][0..20]}..."
      end
      self.message = arr.join(" ")
    end
  end

  def apply_link ## run this after validation, It takes the link_check method and converts it to actual links 
    arr = self.message.split
    index = arr.map{ |word| word.include?("http://") || word.include?("https://")}.index(true)
    if index != nil
      url = arr[index]
      arr[index] = "<a href='#{self.link}' target ='_blank'>#{url}</a>"
    end
    self.message = arr.join(" ")
  end
end
