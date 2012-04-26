Feature: Users see a new green tip each day

	 As a Student
	 Who is concerned about energy usage
	 I want to be able to see a new tip I can use each day

Background:
  Given the following categories exist:
    | id | name                |
    | 1  | General             |
    | 2  | Lab                 |
    
	Given the following tips exist:
  	| id | title           | content                                     |
  	| 1  | Cool Tip        | Stay cool, bro                              |
  	| 2  | Double Cool Tip | Yo dawg, we heard you liked cool tips . . . |
  	
  		Given the following category_tips exist:
	| tip_id | category_id |
	| 1      | 1	       |
	| 2      | 1	       |
	| 2      | 2         |

	And I am on "/"

@javascript
Scenario: Viewing the tip of the day
    When I expand the tip container
    Then I should see one of the tips of the day
