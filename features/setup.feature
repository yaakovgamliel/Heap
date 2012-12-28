@javascript
Feature: A non logged in user visits the site for the first time

  Scenario: A user visits the root url for the first time, is redirected to the default log.

    When I visit '/'
    Then I am redirected to '/heap'
    And I should see 'Heap Team'
