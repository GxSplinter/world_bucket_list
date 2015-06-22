Feature: User can view their Bucket List
  As a User
  I want to view my Bucket List
  So that I can organise my life

  Scenario: User views their Bucket List
    Given I am registered
    And I have created Destinations
    When I view my Bucket List
    Then I see my Destinations in alphabetical order
