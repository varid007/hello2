class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :name, :uniqueness => true,
                    :presence => true, 
                    :length => {:minimum => 1, :maximum => 15},
                    :format => {:with => /[a-zA-Z\s]+$/}
                    
  has_attached_file :photo, :style => {:small => "150x150"} #;photo adalah yang sudah di buat tadi, rails g paperclip ....
end