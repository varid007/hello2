class Category < ActiveRecord::Base
  has_many :products, :dependent => :destroy
  has_many :categories
  
  has_many :child_categories
  
  belongs_to :parent_category 
  validates :name, :uniqueness => true,
                    :presence => true, 
                    :length => {:minimum => 1, :maximum => 15},
                    :format => {:with => /[a-zA-Z\s]+$/}
end
