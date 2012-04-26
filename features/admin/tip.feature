Feature: Managing Tips

	 As an person in charge
	 So I can manage tips
	 I want to be to crud tips	 

Background: I am a authenticated user
            Given I am a new authenticated user
            Given the following tips exist:
 	    | id | title      | content         |
 	    | 1  | save water | shower together |

Scenario: I should be able to see the tip [R]
	  Given I am on "/admin/tips"
	  Then I should see "save water"
	  And I should see "shower together"

@javascript
Scenario: I should be able to create a tip, and see it [C]
 	  Given I am on "/admin/tips/new"
 	  And I fill in "tip_title" with "greatest tip"
 	  And I fill the editor with "this is a cool tip"
 	  And I press "Create Tip"
 	  Then I should be on "/admin/tips"
 	  And I should see "greatest tip was successfully created."
 	  And I should see "this is a cool tip"	  

 @javascript
 Scenario: I should be able to edit a tip, and see the change [U]
 	  Given I am on "/admin/tips"
 	  When I follow "save water"
 	  And I press "Edit"
 	  And I fill in "tip_title" with "be clean"
 	  And I press "Update Tip"
          Then I should see "be clean was successfully updated"
 	  And I go to "/admin/tips"
 	  And I should see "be clean"
 	  And I should not see "save water"
	  
@javascript	  
Scenario: I should be able to delete tips [D]
 	  Given I am on "/admin/tips"
	  Then I should see "shower together"
 	  When I follow "save water"
 	  And I press "Edit"
 	  And I press "Delete Tip"
 	  Then I should see "'save water' deleted"
	  Then I should not see "shower together"

Scenario: Going to Tip that does not exist
	  When I go to "/admin/tips/100"
	  Then I should be on "/admin/tips"
	  And I should see "That tip does not exist."
	  