Feature: Registered users should be able to login

  Scenario: Login Form
    Given the following user:
      | username              | brandon             |
      | email                 | brandon@awesome.com |
      | password              | secret              |
      | password confirmation | secret              |
    When I am on the login page
    And I fill in "Username" with "brandon"
    And I fill in "Password" with "secret"
    And I click "Login In"
    Then I should see a notice of "You have successfully logged in."
    And I should see "Welcome, brandon"
