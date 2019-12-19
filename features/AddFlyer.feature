Feature: User can add a new flyer

Scenario: Add a flyer
  Given I am on the "home" page
  When I follow "Add a new flyer"
  Then I should be on the "Create New Flyer" page
  When I fill in "Title" with "Cuke"
  And I fill in "Location" with "Gourdtown"
  And I fill in "Year" with "2014"
  And I fill in "Month" with "June"
  And I fill in "Day" with "9"
  And I submit
  Then I should be on the "home" page
  And I should see "Cuke"