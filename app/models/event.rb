class Event < ActiveRecord::Base
  has_many :bookings, :dependent=>:destroy
  has_many :users, :through => :bookings
      
 validate :date_in_future
    
    def self.format_time(time)
       return time.strftime("%I:%M %p");
    end
    
    def date_in_future
      if self.date < Date.yesterday then
        errors.add(self.date.to_s, ": Incorrect Date value. Must be in Future.")
      end
    end
    
end
