class User < ActiveRecord::Base
  has_many :products
  has_many :articles
  has_many :comments
  
  attr_accessor :password
  before_save :encrypt_password
  
  
  validates :name,      :presence => true, 
                        :length => {:minimum => 1, :maximum => 20}
  
  validates :address,   :presence => true
                        
  validates :password, :presence => {:on => :create},
                       :confirmation => true
  validates :email, :presence => true,
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}  
   
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def is_admin
    if self.email == "farid@gmail.com"
    end
  end
end
