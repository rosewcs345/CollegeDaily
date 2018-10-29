Feature: roster 

As an event creator/student
I want to view the current attendees
So that I know who's going and I can contact them

#Background: events have been added to the database
Scenario: view roster
  Given the following events exist:
  | title   | date        | location        | host  | start_time  | end_time | description
  | Hiking  | 20-Nov-2018 | Nature Preserve | Brett | 10:30       | 13:30    | "Go hiking! Please sign up ahead of time"
  And  I am on the "Hiking" Event page
  #Then 1 seed events should exist
 
  Given the following roster exists:
  | name              | email                   | info     |
  | Kristen Boscarino | kboscar1@binghamton.edu | have car |

  When I follow "Roster"
  Then I should see "Kristen Boscarino" in the name column of Roster
  And I should see "kboscar1@binghamton.edu" in the email column of Roster
  And I should see "have car" in the info column of Roster


