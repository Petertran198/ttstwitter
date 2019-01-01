class AddLinkToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :link, :string
  end
end
