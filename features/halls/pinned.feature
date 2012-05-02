Feature: User can have pinned buildings

         As a normal user
         So I can view buildings that I frequent
         I want to pin buildings

Background:
	Given the following halls exist:
  	| id | name    | key |
  	| 1  | Soda    | 222 |
  	| 2  | Cory    | 777 |
  	| 3  | Krober  | 666 |
	And I am on "/halls"

@javascript
Scenario: Buildings are in alphabetical order to start with, but pinned buildings will be shown first
	  Then I should see "Cory" before "Krober"
	  Then I should see "Krober" before "Soda"
 	  Given I pin "Soda"
 	  Then I should see "Soda" before "Cory"
 	  And I should see "Soda" before "Krober"	  


@javascript
Scenario: Set a building as a pinned, and make sure they persist
	  Given I pin "Soda"
	  Then I should see "Soda" hall pinned
	  Then I should not see "Cory" hall pinned


@javascript
Scenario: Unpinning should make items not be pinned anymore
	  Given I pin "Soda"
 	  Given I pin "Cory"
 	  Given I unpin "Cory"
 	  Then I should see "Soda" hall pinned
 	  Then I should not see "Cory" hall pinned


