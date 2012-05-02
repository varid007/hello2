class Countrie < ActiveRecord::Base
  belongs_to :user
  
  validate :valid_id
  def valid_id
    self.errors[:code]<< "Harus id, usa atau frc" unless code =="id" || code == "usa" || code == "frc"
  end
  
  validates :name,  :presence => true, 
                    :length => {:minimum => 1, :maximum => 15},
                    :format => {:with => /[a-zA-Z\s]+$/}
end


