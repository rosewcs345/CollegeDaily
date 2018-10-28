# Add a declarative step here for populating the DB with movies.

Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Event.create!(event)
  end
  #fail "Unimplemented"
end

Then /(.*) seed events should exist/ do | n_seeds |
  Event.count.should be n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Given /the following roster exists/ do |roster_table|
  roster_table.hashes.each do |roster|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Roster.create!(roster)
  end
  #fail "Unimplemented"
end

