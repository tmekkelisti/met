class RemoveStoryIdAndCommentIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :story_id, :integer
    remove_column :users, :comment_id, :integer
  end
end
