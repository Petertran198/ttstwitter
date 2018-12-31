class AddFollowingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :following, :text
  end
end
