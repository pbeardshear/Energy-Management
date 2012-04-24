Feature: User can have pinned buildings

         As a building manager
         So I can view buildings that I frequent
         I want to pin buildings

Background:
	Given the following halls exist:
  	| id | name  | key |
  	| 2  | Soda  | 222 |
  	| 3  | Cory  | 777 |
	And I am on "/halls"
	
@javascript
Scenario: Set a building as a pinned, and make sure they presist
  	  Given I pin "Soda"
	  Then I should see "Soda" within "css_selector_for_pinned list"
	  Then I should not see "Cory" within "css_selector_for_pinned list"
	  Given I am on "/"
	  Given I am on "/halls"
	  Then I should see "Soda" within "css_selector_for_pinned list"
	  Then I should not see "Cory" within "css_selector_for_pinned list"

@javascript
Scenario: Unpinning should make items not be pinned anymore
  	  Given I pin "Soda"
  	  Given I pin "Cory"
	  Given I unpin "Cory"
	  Then I should see "Soda" within "css_selector_for_pinned list"
	  Then I should not see "Cory" within "css_selector_for_pinned list"
	  Given I am on "/"
	  Given I am on "/halls"
	  Then I should see "Soda" within "css_selector_for_pinned list"
	  Then I should not see "Cory" within "css_selector_for_pinned list"
