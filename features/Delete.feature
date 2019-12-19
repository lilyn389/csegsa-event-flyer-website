Feature: Delete

Scenario: delete flyer
  Given I am on the "home" page
  Then I should see "Cuke"
  When I follow "More about Cuke"
  Then I should see "Details about Cuke"
  Then I click "Delete"
  Then I should be on the "home" page
  And I should not see "Cuke"