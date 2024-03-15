Feature: Verify Get/Post API
  Background:
    Given url "https://reqres.in"

  Scenario: Verify response get method of users page 2
    Given path "/api/users?page=2"
    When method get
    Then status 200
    And match response == "#object"
    And match response.per_page == 6
    And match response.total == 12
    And match response.total_pages == 2

  Scenario: Verify response post method of create new user
    Given path "/api/users"
    And request
    """
    {
    "name": "morpheus",
    "job": "leader"
    }
    """
    When method post
    Then status 201
    And match response == "#object"
    And match response.id == "#notnull"
    And match response.name == "morpheus"
    And match response.job == "leader"

