class Product < ActiveRecord::Base
  belongs_to :user
  has_many :categories_products
  has_many :categories, :through => :categories_products

  scope :prince_more_than_1000, where("prince >= 1000")
end

