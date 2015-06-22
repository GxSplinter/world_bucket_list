Feature: A User can register
  As a User
  I want to register
  So I can manage my Bucket List

  Scenario: successfully registering
    Given I am not registered
    When I register
    Then my account is created
    And I am directed to my profile
