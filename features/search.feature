Feature: Users can search for buildings

	 As a student
	 So I can find my residence hall
	 I want to search for buildings by name

Background:
	Given I am on the overview page

Scenario: searching for a building by name that does not exist
	  And I search for “Hall X”
	  Then I should see no Halls

Scenario: searching for a building by full name
	  And I search for “Evans” Hall
	  Then I should see the “Evans” Hall

Scenario: searching for a building by substring of name that does exist
	  And I search for “Ballroom” hall
	  Then I should see the “MLK Ballroom” hall