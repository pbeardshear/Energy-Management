Feature: Users can search for buildings

	 As a student
	 So I can find my residence hall
	 I want to search for buildings by name

Background:
  Given the following halls exist:
  | id | name        | key | operational_unit_id  | 
  | 1  | Dwinelle    | 111 | 1                    |
  | 2  | Soda        | 222 | 2                    |
  | 3  | McLaughlin  | 777 | 3                    |
  | 5  | McCone      | 888 | 4                    |
  And I am on "/halls"

Scenario: not searching for any building
  Then I should see all the halls
  
@javascript
Scenario: searching for a building by name that does not exist
	Given I search for "Brandy" hall
	Then I should not see "Dwinelle" hall
  And I should not see "Soda" hall
  And I should not see "McLaughlin" hall
  And I should not see "McCone" hall

@javascript
Scenario: searching for a building by full name
	Given I search for "Soda" hall
	Then I should see "Soda" hall
  And I should not see "Dwinelle" hall
  And I should not see "McLaughlin" hall
  And I should not see "McCone" hall

@javascript
Scenario: searching for a building by substring of name that does exist
	Given I search for "Mc" hall
	Then I should see "McLaughlin" hall
  And I should see "McCone" hall
  And I should not see "Dwinelle" hall
  And I should not see "Soda" hall
