class Booking < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  
  # this is false so host is auto signed up for the even they create
  validates :event_id, :presence => false
  
  validates_associated :event
  validate :positive_bookings
  
  def positive_bookings
    
    if self.usable_seats < 0 then
        errors[:event] << "Must have 0 or more seats."
    end
  end
      
end
