class Comment < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  validates :content, presence: true
  validates :story_id, presence: true
  validates :user_id, presence: true

end

