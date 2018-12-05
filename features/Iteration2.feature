Feature: Create new user on university writing tracker

    As a new student
    So that I can begin to track my progress
    I want to create a new account on University tracker

Background: login page

    Given the following users exist:
      | Amith | Murakonda | amithmurakonda@gmail.com || 1 | $2a$10$Mt.ehSw8N3N8eIs0MpmEI./rSuWAreOu9aLqFDWIYsRCp004/af7G | $2a$10$Mt.ehSw8N3N8eIs0MpmEI. |

    Scenario: add user
      When I am on "create" users page
      And  I fill in "First Name" with "Amith"
      And I fill in "Last Name" with "Murakonda"
      And I fill in "Email" with "random5@gmail.com"
      And I fill in "Password" with "amith123"
      And I fill in "Confirm Password" with "amith123"
      And  I press "Signup"
      Then I should be on "login" page

    Scenario: User login
    When I am on "login" users page
    And I fill in "Email" with "amithmurakonda@gmail.com"
    And I fill in "Password" with "amith@123"
    And I press "Login"
    Then I should be on 'auth' page
