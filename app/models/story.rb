class Story < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy

end
