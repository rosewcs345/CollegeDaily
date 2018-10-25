Feature: sign up for an event

  As a student
  I want to be able to join an event 
  So that my spot is reserved


Background: events have been added to the database

  Given the following events exist:
  | title              | date       | location         |
  | ACM Meeting        | 10/21/2018 | UU120            |
  | Hiking Event       | 10/23/2018 | Nature Preserve  |
  And  I am on the ACM Meeting event page

Scenario: add a user to an event
  When I follow "Sign Up"
  And I fill in "Name" with "Kristen Boscarino"
  And I fill in "Email" with "kboscar1@binghamton.edu"
  When I press "Submit"
  Then I should see "Kristen Boscarino" in the Roster

