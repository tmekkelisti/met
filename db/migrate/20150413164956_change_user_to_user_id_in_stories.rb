class ChangeUserToUserIdInStories < ActiveRecord::Migration
  def change
    remove_column :stories, :user, :integer
    add_column :stories, :user_id, :integer
  end
end
