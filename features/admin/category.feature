Feature: Managing Categories

	 As an person in charge
	 So I can manage categories
	 I want to be to categories

Background: I am a authenticated user
            Given I am a new authenticated user
            Given the following categories exists:
 	    | id | name     |
 	    | 1  | general  |

Scenario: I should be able to see the categories [R]
	  Given I am on "/admin/categories"
	  Then I should see "general"

@javascript
Scenario: I should be able to create a create a category, and see it [C]
	  Given I am on "/admin/categories"
	  Then I should not see "office"
 	  Given I am on "/admin/categories/new"
	  And I fill in "category_name" with "office"
	  And I press "Create category"
	  Then I should be on "/admin/categories"
	  And I should see "general"
	  And I should see "office"	  

 @javascript
 Scenario: I should be able to edit a category, and see the change [U]
 	  Given I am on "/admin/categories"
 	  When I follow "general"
 	  And I press "Edit"
 	  And I fill in "category_name" with "lab"
 	  And I press "Update Category"
#         Then I should see "be clean was successfully updated"
 	  And I go to "/admin/categories"
 	  And I should see "lab"
 	  And I should not see "general"
	  
@javascript	  
Scenario: I should be able to delete categories [D]
 	  Given I am on "/admin/categories"
	  Then I should see "general"
 	  When I follow "general"
 	  And I press "Edit"
 	  And I press "Delete Category"
 	  Then I should see "Category 'general' deleted"
	  Then I should not see "general" within "table"
