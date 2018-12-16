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
      
      eventDateTime = DateTime.now.in_time_zone("Eastern Time (US & Canada)").change( {year: year, month: month,
        day: day, hour: hour, min: min, sec: sec })
      
      dateTimeNow = DateTime.now.in_time_zone("Eastern Time (US & Canada)")
      errorMsg = self.date.to_s + " " + self.class.format_time(self.start_time)
      
      if eventDateTime < dateTimeNow then
        errors.add(errorMsg, ": Incorrect Date and Time value. Must be in Future.")
      end
    end
    
end
