class User < ActiveRecord::Base
  has_many :bookings
  has_many :events, :through => :bookings
  validates :name, :presence => true
  validates :email, :presence => true
  # ********************************************
  #validate :valid_suny_id
  
  #def valid_suny_id
    #use regular expression here
    #errors.add(:email, 'invalid suny id') if
      #condition not met
  #end
 
  def self.create_with_omniauth(auth)
    User.create!(
      :provider         => auth["provider"],
      :uid              => auth["uid"],
      :email            => auth["info"]["email"],
      :name             => auth["info"]["name"],
      :location         => auth["extra"]["raw_info"]["location"])
  end	        
      
end
