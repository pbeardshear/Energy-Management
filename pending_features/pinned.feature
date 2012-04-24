Feature: User can have pinned buildings

         As a normal user
         So I can view buildings that I frequent
         I want to pin buildings

@javascript
Scenario: Set a building as a pinned
          #Given I am viewing "Soda" hall
          #When I check "Pinned"
          #And I go to the dashboard view
          #Then I should see "Soda" hall under the pinned tab
	  Given I am on halls page
	  And no halls are pinned
	  When I click on Soda hall
	  And I click on Evans hall
	  Then I should see Evans hall before Soda hall
	  And I should see Soda hall before Cory hall
	  And I should see Cory hall before Dwinelle hall

@javascript
Scenario: Unpinning should make items not be pinned anymore
          #Given I am viewing "Soda" hall
          #When I uncheck "Pinned"
          #And I go to the dashboard view
          #Then I should see "Cory" hall under the pinned tab
          #Then I should not see "Soda" hall under the pinned tab
	  Given I am on halls page
          Given the following halls are pinned: Soda,Cory
	  When I follow Soda hall
	  And I follow Cory hall
	  Then I should see Cory hall before Dwinelle hall
	  And I should see Dwinelle hall before Evans hall
	  And I should see Evans hall before Soda hall  