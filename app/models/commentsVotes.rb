class CommentsVote < ActiveRecord::Base
  belongs_to :author
  belongs_to :comment
  has_many :commentsVotes
end
