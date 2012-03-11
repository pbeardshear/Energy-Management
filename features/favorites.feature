Feature: User can have favorite buildings

	 As a building manager
	 So I can view buildings that I frequent
	 I want to have my favorite buildings on top of the overview


Scenario: Set a building as a favorite
	  Given I am viewing “Soda” hall
	  When I select “Favorite”
	  And I go to the dashboard view
	  Then I should see “Soda” hall under favorites

Scenario: Viewing dashboard when no favorite buildings are filtered out
	  Given the following halls are favorites: Soda,Cory,Dwinelle
	  And no filters are applied
	  Then I should see “Soda” hall under favorites
	  And I should see “Cory” hall under favorites
	  And I should see “Dwinelle” hall under favorites

Scenario: Viewing dashboard when some favorite buildings are filtered by search
	  Given the following halls are favorites: Soda,Cory,Dwinelle
	  And I search for “Soda”
	  When I go to the dashboard view
	  Then I should see “Soda” hall under favorites
	  And I should not see “Cory” hall under favorites

Scenario: Viewing dashboard when some favorite buildings are filtered by operational units
	  Given the following halls are favorites: Soda,Kroeber
	  When I select “College of Engineering” from the Operational Unit drop-down menu
	  Then I should see “Soda” hall under favorites
	  And I should not see “Kroeber” hall under favorites

Scenario: Viewing dashboard when some favorite buildings are filtered by operational units and search
	  Given the following halls are favorites: Soda,Kroeber,Cory
	  When I select “College of Engineering” from the Operational Unit drop-down menu
	  And I search for “Cory”
	  Then I should see “Cory” hall under favorites
	  And I should not see “Kroeber” hall under favorites
	  And I should not see “Soda” hall under favorites


Scenario: Viewing dashboard when all favorite buildings are filtered out
	  Given the following halls are favorites: Soda,Cory
	  And I search for “Koshland”
	  When I go to the dashboard view
	  Then I should not see any favorites