Feature: Registered users should be able to login
  Background:
    Given the following user:
      | username              | brandon             |
      | email                 | brandon@awesome.com |
      | password              | secret              |
      | password confirmation | secret              |
    When I am on the login page

  Scenario: Successful login
    When I fill in "Username" with "brandon"
    And I fill in "Password" with "secret"
    And I click "Login"
    Then I should see a notice of "You have successfully logged in."
    And I should see "Welcome, brandon"

  Scenario: Unsuccessful login
    When I fill in "Username" with "bob"
    And I fill in "Password" with "secret"
    And I click "Login"
    Then I should see a alert of "Authentication has failed!"
    And I should not see "Welcome, bob"
