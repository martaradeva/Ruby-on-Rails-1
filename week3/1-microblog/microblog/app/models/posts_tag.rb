class PostsTag < ActiveRecord::Base
  has_many :posts
  has_many :tags
end
