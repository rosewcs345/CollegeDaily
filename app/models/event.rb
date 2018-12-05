class Event < ActiveRecord::Base
  has_many :bookings, :dependent=>:destroy
  has_many :users, :through => :bookings
      
 validate :date_in_future
    
    def self.format_time(time)
       return time.strftime("%I:%M %p");
    end
    
    def date_in_future
      if self.date < Date.today then
        errors.add(self.date.to_s, ": Incorrect Date value. Must be in Future.")
      #elsif self.start_time < (Time.now + 2.minutes) then
        #errors.add(self.start_time.to_s, Time.now, ": Incorrect Time value. Must be in Future.")
      #elsif self.end_time < Time.now then
       # errors.add(self.end_time.to_s, ": Incorrect Time value. Must be in Future.")
      end
    end
    
end
