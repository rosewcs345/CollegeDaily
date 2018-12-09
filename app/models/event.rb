class Event < ActiveRecord::Base
  has_many :bookings, :dependent=>:destroy
  has_many :users, :through => :bookings
      
 validate :date_in_future
    
    def self.format_time(time)
       return time.strftime("%I:%M %p");
    end
    
    def date_in_future
      year = self.date.year
      month = self.date.month
      day = self.date.day
     
      hour = self.start_time.hour
      min = self.start_time.min
      sec = self.start_time.sec
       
       
      if DateTime.new(year, month, day, hour, min, sec) < DateTime.now.in_time_zone("Eastern Time (US & Canada)") then
        errors.add(self.date.to_s, ": Incorrect Date value. Must be in Future.")
      end
    end
    
end
