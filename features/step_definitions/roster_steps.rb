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

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  
  expect(page.body).to match(/.*#{e1}.*#{e2}/m)
  
  
  #fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  
  rating_list.split(", ").each do |rating|
    step %Q{I #{uncheck}check "ratings_#{rating}"}
  end
  
 # fail "Unimplemented"
end


Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  rows = page.all('table#movies tbody tr').count
  expect(rows).to eq 10
  #fail "Unimplemented"
end

  