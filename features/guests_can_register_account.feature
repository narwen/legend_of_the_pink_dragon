Feature: User can register for a new account

  Scenario: User fills out the new registration form
    Given I am on the new account page
    When I fill in "Username" with "brandon"
    And I fill in "Email" with "brandon@awesome.com"
    And I fill in "Password" with "secret"
    And I fill in "Password confirmation" with "secret"
    And I click "Register"
    Then I should see a notice of "You have successfully registered."
    And I should see "Welcome, brandon"
