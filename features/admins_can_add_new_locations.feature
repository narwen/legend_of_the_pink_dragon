Feature: Admin users can add new locations

  Scenario: Successfully adding new location
    Given I am a authenticated admin
    And I am on the new admin location page
    When I fill in "Name" with "New york New york"
    And I fill in "Description" with:
      """
      The new land of hope and
      prosperity
      """
    And I click "Save"
    Then I should see a notice of "Location successfully created."
    And I should be on that admin location page
    And I should see "Name: New york New york"
    And I should see "Description: The new land of hope and prosperity"
