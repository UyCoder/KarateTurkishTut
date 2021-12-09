Feature: This featrue includes tasks that we will solve
  Task 1: Get request and verify status, print response
  Task 2: Post request
  Task 3: Post with external json file
  Task 4: Scenario outline
  Task 5: Scenario Outline with csv
  Task 6: Calling js fuction
  Task 7: Caller
  Task 8: Runners and paraller runner
  Task 9: Gatling integration and perf test
  Video tutorial link:  https://www.youtube.com/watch?v=u2GhGUGp-1c

  Background:
    Given url BaseUrl

  Scenario: Task 1 Get request and verify status, print response
    And path 'pet', 255
    When method get
    Then print response

  Scenario: Task 2 Post request
    And path 'pet'
    * def my_request =
    """
          {
            "category": {
              "id": 0,
              "name": "string"
            },
            "name": "doggie",
            "photoUrls": [
              "string"
            ],
            "tags": [
              {
                "id": 0,
                "name": "string"
              }
            ],
            "status": "available"
          }
    """
    And request my_request
    When method post
    Then status 200
    Then karate.log(response)
    Then match response.id == '#number'

  Scenario: Task 3 Post with external json file
    And path 'pet'
    And def myRequestBody = read('classpath:data/pet.json')
    And request myRequestBody
    When method post
    Then status 200
    Then print response
    And match response.id == '#present'
    And match response contains {category: {"name":"#string","id":"#number"}}


  Scenario Outline: Task 4 Scenario outline <id>
    And path id
    When method get
    Then print response

    Examples:
      | id  |
      | 250 |
      | 251 |
      | 252 |


  Scenario Outline: Task 5 Scenario Outline with csv <number>
    And path number
    When method GET
    Then print response

    Examples:
      | read('classpath:data/data.csv') |


  Scenario: Task 6 Calling js function
    * def random = call read('classpath:data/randomString.js')
    * def myRandomString = random(10)
    * def myRequestBody = read('classpath:data/pet.json')
    And set myRequestBody.name = myRandomString
    And request myRequestBody
    When method POST
    Then status 404
    And print response

  Scenario: Task 7 Caller
    * def myCaller =  call read('classpath:caller/DemoForTask7.feature')
    Then print myCaller.response.id

  Scenario: Task 8 Runners and paraller runner
    # check out classpath:meetup/ParallerRunner.java

  Scenario: Task 9 Gatling integration and perf test



