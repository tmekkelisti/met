class Story < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :story, length: {minimum: 10}
  validates :title, length: {in: 3..33}

end
