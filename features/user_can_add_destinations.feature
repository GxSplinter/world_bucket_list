Feature: User can add destinations
  As a user
  I want to add Destinations
  So that I can assign my Bucket List entries

  Scenario: A User successfully adds a Destination
    Given I am registered
    When I add a uniquely named Destination
    Then the Destination appears on my Bucket List
