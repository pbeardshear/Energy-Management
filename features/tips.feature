Feature: See list of tips specific to location

	 As a new student
	 So I can save more energy
	 I want to be able to see a list of energy tips specific to residence halls.

Scenario: See tips for residence halls
	  Given I am in the residence halls
	  When I go to the energy tips page
	  Then I should see the tip for “taking a shorter shower”
	  And I shouldn’t see the tip for “turning off the A/C”

Scenario: See tips for offices
	  Given I work in an office
	  When I go to the energy tips page
	  Then I should see the tip for “turning off the A/C”
	  And I should not see the tip for “taking a shorter shower”

Scenario: See general tips regardless of location
	  When I go to the energy tips page
	  Then I should see the tip for “Using florescent light bulbs”
	  And I should see the tip for “Turn off your computer monitor if away for more than 10 minutes”
