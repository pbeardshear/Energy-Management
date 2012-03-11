Feature: User can filter buildings on dashboard by operational unit

	 As a building manager
	 So I can find my relevant buildings
	 I want to filter buildings by operational units

Scenario: Filter by operational unit
	  Given I am on the dashboard view
	  When I select “College of Engineering” from the Operational Unit drop-down menu
	  I should see “Soda” hall
	  And I should not see “Dwinelle” hall