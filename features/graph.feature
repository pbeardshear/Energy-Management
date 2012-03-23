Feature: Track energy usage over time

	 As a building manager
	 So that I can track energy usage over time
	 I want to be able to see a graph of energy usage over time.

Scenario: view energy usage over the past week
	  Given I am viewing "Evans" hall
	  When I select "week" from the time interval dropdown
	  Then I should see the usage graph for the past week

Scenario: view energy usage by month
	  Given I am viewing "Soda" hall
	  When I select "month" from the time interval dropdown
	  Then I should see the usage graph for the past week