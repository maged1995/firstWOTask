class Blog < ActiveRecord::Base
  belongs_to :author
  has_and_belongs_to_many :tags
  has_many :comments
  has_many :blogsVotes
end
