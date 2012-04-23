Feature: Users can search for buildings

	 As a student
	 So I can find my residence hall
	 I want to search for buildings by name

Background:
	Given I am on '/halls'
  And the following halls exist:
  | name        | key | 
  | Dwinelle    | 111 |
  | Soda        | 222 |
  | McLaughlin  | 777 |
  | McCone      | 888 |

Scenario: not searching for any building
  Then I should see "Dwinelle" hall
  And I should see "Soda" hall
  And I should see "McLaughlin" hall
  And I should see "McCone" hall

@javascript
Scenario: searching for a building by name that does not exist
	Given I search for "Brandy" hall
	Then I should see not see "Dwinelle" hall
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
