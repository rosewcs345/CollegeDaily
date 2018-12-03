class Booking < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  
  validates :event_id, :presence => true
  validates_associated :event
      
end
