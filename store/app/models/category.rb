class Category < ActiveRecord::Base
  has_many :products, :dependent => :destroy

  has_many :child_categories, :dependent => :destroy,
           :class_name => "Category",
           :foreign_key => "parent_id"
                           
  belongs_to :parent_category,
             :class_name => "Category",
             :foreign_key => "parent_id"

  scope :parent_category, where("parent_id is NULL ")
 
  validates :name, :uniqueness => true,
                    :presence => true, 
                    :length => {:minimum => 1, :maximum => 15},
                    :format => {:with => /[a-zA-Z\s]+$/}
end
