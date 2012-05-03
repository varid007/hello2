class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  scope :rating_is_and_above, lambda {|rate| where("rating > ?", rate) }
  validates :title, :uniqueness => true,
                    :presence => true, 
                    :length => {:minimum => 1, :maximum => 15},
                    :format => {:with => /[a-zA-Z\s]+$/}
end
