class Event < ActiveRecord::Base
    before_save :format_time
    def format_time
        self.start_time = self.start_time.strftime "%I:%M %p"
        self.end_time = self.end_time.strftime "%I:%M %p"
    end
end
