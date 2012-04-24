Feature: Users can view tips data

	 As a User
	 So I can learn to better myself
	 I want to be able to see tips

Background:
	Given the following categories exist:
	| id | name    |
	| 1  | General |
	| 2  | Office  |

	Given the following tips exist:
  	| id | title       | content			              |
  	| 1  | save water  | shower together		              |
	| 2  | save water  | dont shower		              |
	| 3  | save engery | buy light bulbs that floursce	      |
	| 4  | thermal     | close doors and windows when ac is on |
	| 5  | computers   | turn off your moniter when you away   |
	| 6  | turn off    | turn off what you are not using       |

	Given the following category_tips exist:
	| tip_id | category_id |
	| 1      | 1	       |
	| 2      | 1	       |
	| 3      | 2	       |
	| 4      | 2	       |
	| 5      | 2	       |
	| 6      | 1	       |

@javascript
Scenario: It should collapse tips and show tips correctly
	  Given I am on "/tips"
	  Then I should see 0 tips

	  When I follow "General"
	  Then I should see 2 tips

	  When I follow "Office"
	  Then I should see 5 tips

	  When I follow "General"
	  Then I should see 3 tips

	  When I follow "Office"
	  Then I should see 0 tips
