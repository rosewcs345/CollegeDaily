class Event < ActiveRecord::Base
    
    def self.format_time(time)
       return time.strftime("%I:%M %p");
    end
    
    
end
