Feature: User can have pinned buildings

         As a building manager
         So I can view buildings that I frequent
         I want to pin buildings

Scenario: Set a building as a pinned
          Given I am viewing "Soda" hall
          When I check "Pinned"
          And I go to the dashboard view
          Then I should see "Soda" hall under the pinned tab

Scenario: Unpinning should make items not be pinned anymore
          Given the following halls are favorites: Soda,Cory
          Given I am viewing "Soda" hall
          When I uncheck "Pinned"
          And I go to the dashboard view
          Then I should see "Cory" hall under the pinned tab
          Then I should not see "Soda" hall under the pinned tab
