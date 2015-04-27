class User < ActiveRecord::Base
  has_secure_password


  has_many :stories
  has_many :comments
  has_many :likes, dependent: :destroy

  validates :username, uniqueness: true,
      length: { in: 3..15 }

  validates :password, length: { minimum: 4 }

  #validates :password, format: { with: /\d.*[A-Z]|[A-Z].*\d/, message: "has to contain one number and one uppercase letter"}

end
