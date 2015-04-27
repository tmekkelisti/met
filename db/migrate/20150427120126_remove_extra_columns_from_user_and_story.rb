class RemoveExtraColumnsFromUserAndStory < ActiveRecord::Migration
  def change
    remove_column :users, :like_id, :integer
    remove_column :stories, :like_id, :integer
  end
end
