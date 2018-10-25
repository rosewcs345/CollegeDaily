# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    events =
        [
        {:title => 'Game night',  :host => 'George', :date => '25-Nov-2018', :start_time =>'11:30', :end_time => '12:30', :location => "UU102", :description => "Come play games!"},
        {:title => 'Fun time',  :host => 'Fred', :date =>'25-Nov-2018', :start_time =>'14:30', :end_time => '15:30', :location => "UU112", :description => "Fun with Fred"},
        {:title => 'Studying CS445',  :host => 'Rose', :date =>'27-Nov-2018', :start_time =>'16:00', :end_time => '18:30', :location => 'EB Q22', :description => "Learn!"},
        {:title => 'Hiking',  :host => 'Brett', :date =>'20-Nov-2018', :start_time =>'10:30', :end_time => '13:30', :location => 'Nature Preserve', :description => "Go hiking! Please sign up ahead of time"}
        
        ]
    
    events.each do |event|
        Event.create! event
    end