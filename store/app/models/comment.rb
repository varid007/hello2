class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  
  validates :comment, :presence => true

 belongs_to :parent_comments,:dependent =>:destroy,
          :class_name => "Comment",
          :foreign_key => "comment_id"

 has_many :cild_comments,:dependent =>:destroy,
          :class_name => "Comment",
          :foreign_key => "comment_id"
end
