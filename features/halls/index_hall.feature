Feature: Users can navigate through the hall index page

	 As a User
	 So I can get going
	 I want to be able to navigate through pages

Background:
	Given the following halls exist:
  	| id | name   | key                          |
  	| 1  | Shofix | Bd5238Ki31GOL5ZewrQglA%3D%3D |
	And I am on "/halls"

@javascript
Scenario: Going to the show page and back
	  When I follow "Shofix"
	  Then I should be on "/halls/1"
	  When I follow "Back" within "#graphContent"
	  Then I should be on "/halls"
