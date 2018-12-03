class Event < ActiveRecord::Base
  has_many :bookings, :dependent=>:destroy
  has_many :users, :through => :bookings
      
end
