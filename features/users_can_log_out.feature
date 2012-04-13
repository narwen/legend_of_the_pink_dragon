Feature: Authenticated user can logout

  Scenario: Logout link
    Given I am a authenticated user
    And I am on the home page
    When I click the link "Logout"
    Then I should see a notice of "You have successfully logged out."
    And I should not see the welcome message
