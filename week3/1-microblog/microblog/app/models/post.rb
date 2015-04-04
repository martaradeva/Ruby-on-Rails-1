class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  has_many :posts_tags
  has_many :posts, through: :posts_tags
end
