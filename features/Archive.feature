Feature: Archive page

Scenario: Go to archive page and return to active flyers page
  Given I am on the "home" page
  When I follow "Archive"
  Then I should be on the "Archive" page
  Then I should see "Archived Flyers"
  When I follow "Back to active flyers page"
  Then I should be on the "home" page
  Then I should see "Active Flyers"
  
Scenario: Archive Weekend Kickoff
  Given I am on the "home" page
  Then I should see "Christmas Kickoff"
  When I follow "More about Christmas Kickoff"
  Then I should be on the "Details about Christmas Kickoff" page
  And I should see "Details about Christmas Kickoff"
  When I submit
  Then I should be on the "Details about archived Christmas Kickoff" page
  And I should see "Details about archived Christmas Kickoff"
  And I should see "Flyer 'Christmas Kickoff' was successfully updated."
  
  
Scenario: Unarchive flyers
  Given I am on the "Archive" page
  Then I should see "Christmas Kickoff"
  When I follow "More about Christmas Kickoff"
  Then I should be on the "Details about archived Christmas Kickoff" page
  And I should see "Details about archived Christmas Kickoff"
  When I submit 
  Then I should be on the "Details about Christmas Kickoff" page
  And I should see "Details about Christmas Kickoff"
  And I should see "Flyer 'Christmas Kickoff' was successfully updated."
  
  
Scenario: Make sure you can't unarchive flyers with expired event date
  Given I am on the "Archive" page
  Then I should see "Weekend Kickoff"
  When I follow "More about Weekend Kickoff"
  Then I should be on the "Details about archived Weekend Kickoff" page
  And I should see "Flyer event date must be on or after"