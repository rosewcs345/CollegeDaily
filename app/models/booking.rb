class Booking < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  
  validates :event_id, :presence => true
  validates_associated :event
  validate :positive_bookings
  
  def positive_bookings
    if self.usable_seats < 0 then
        errors[:event] << "Must have 0 or more seats."
    end
  end
      
end
