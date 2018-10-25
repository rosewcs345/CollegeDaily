Feature: roster 

As an event creator/student
I want to view the current attendees
So that I know who's going and I can contact them

Background: events have been added to the database

  Given the following events exist:
  | title              | date       | location         |
  | ACM Meeting        | 10/21/2018 | UU120            |
  | Hiking Event       | 10/23/2018 | Nature Preserve  |
  And  I am on the ACM Meeting event page
 
  Given the following roster exists:
  | name              | email                   | info     |
  | Kristen Boscarino | kboscar1@binghamton.edu | have car |

Scenario: view roster
  And I follow Roster
  Then I should see "Kristen Boscarino" in the name column of Roster
  And I should see "kboscar1@binghamton.edu" in the email column of Roster
  And I should see "have car" in the info column

