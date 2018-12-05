Feature: Create new tasks and Editing the tasks



Background: I logged in as "amithmurakonda@gmail.com"

    Given the following users exist:
    | Amith | Murakonda | amithmurakonda@gmail.com || 1 | $2a$10$Mt.ehSw8N3N8eIs0MpmEI./rSuWAreOu9aLqFDWIYsRCp004/af7G | $2a$10$Mt.ehSw8N3N8eIs0MpmEI. |

    Given the following tasks:
    | Task 1 | 2018-10-29 14:18:21 |2019-02-16 00:00:00 | 235 || Complete my thesis by February 16th | Pages | 1 |

    Scenario: create task
    When I am on the dashboard
    And I press "New Task"
    Then I should be on "new task" page
