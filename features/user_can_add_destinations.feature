Feature: User can add destinations
  As a user
  I want to Destinations
  So that I can assign my Bucket List entries

  Scenario: A User successfully adds a Destination
    Given I am registered
    When I add a uniquely named Destination
    Then the Destinations appear on my profile
