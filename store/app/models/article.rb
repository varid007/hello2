class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments ,:dependent => :destroy
  
  validates :title, :uniqueness => true,
                    :presence => true, 
                    :length => {:minimum => 1, :maximum => 15},
                    :format => {:with => /[a-zA-Z\s]+$/}
end
