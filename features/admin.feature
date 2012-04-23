Feature: Single admin user

	 As an person in charge
	 So I can manage things
	 I want to be able to login/logout and get redirected to corrected places

Scenario: I shld be redirected to sign up if no admin exists
	  Given I am not authenticated
	  When I go to "/admin"
	  Then I should be on "/admins/sign_up"
	  When I go to "/admin/tips"
	  Then I should be on "/admins/sign_up"
	  When I go to "/admin/categories"
	  Then I should be on "/admins/sign_up"

Scenario: I shld be able to create a user
	  When I go to "/admins/sign_up"
	  And I fill in "admin_email" with "test@example.com"
	  And I fill in "admin_password" with "coolboy"
	  And I fill in "admin_password_confirmation" with "coolboy"
	  And I press "Sign up"
	  Then I should be on "/admin/"
	  
Scenario: I shld be redirected to sign in if an admin exists, and logout works
	  Given I am a new authenticated user
	  And I go to "/admins/sign_out"
	  When I go to "/admin"
	  Then I should be on "/admins/sign_in"
	  When I go to "/admin/tips"
	  Then I should be on "/admins/sign_in"
	  When I go to "/admin/categories"
	  Then I should be on "/admins/sign_in"
