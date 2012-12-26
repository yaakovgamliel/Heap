Feature: Users with heaplogs

  Scenario: visiting a user's only heaplog
    Given a user exists
    And they have a heaplog
    # And that heaplog has 10 posts
    When I go to the user's page
    Then I should see the heaplog's banner
    # And I should see the 10 posts
