Feature: A User can add ToDos to a Destination
  As a User
  I want to add ToDo entries
  So I can organise my life

  @javascript
  Scenario: susscessfully adding ToDos to a Destination
  Given I am registered
  And I have created Destinations
  When I view my Bucket List
  And I add a ToDo to a Destination
  Then the ToDo appears under its Destination on the Bucket List
  And The ToDo has longitude and latitude
