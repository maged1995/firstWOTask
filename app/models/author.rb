class Author < ActiveRecord::Base
  has_secure_password
  
  has_many :blogs
  has_many :comments
  has_many :blogsVotes
  has_many :commentsVotes
end
