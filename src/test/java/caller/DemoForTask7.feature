Feature: demo caller

  Scenario: demo for Task 7
    Given url BaseUrl
    And path 'pet', 250
    When method GET
    Then print response
