class Event < ActiveRecord::Base
  has_many :bookings, :dependent=>:destroy
  has_many :users, :through => :bookings
      
    
    def self.format_time(time)
       return time.strftime("%I:%M %p");
    end
    
    
end
