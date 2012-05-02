class User < ActiveRecord::Base
  has_many :products
  has_many :articles
  has_many :countries

  def show_full_name
    
    "#{self.first_name} #{self.last_name}"
  end

end
