Feature: Verify Get/Post API
  Background:
    # đi đến url https://reqres.in
    Given url "https://reqres.in"

  Scenario: Verify response get method of users page 2
    # gắn path vào url ở background
    Given path "/api/users?page=2"
    # sử dụng method get
    When method get
    # verify response trả về status 200
    Then status 200
    # verify response trả về dạng object
    And match response == "#object"
    # verify response trả về per_page = 6
    And match response.per_page == 6
    # verify response trả về total = 12
    And match response.total == 12
    # verify response trả về total_pages = 2
    And match response.total_pages == 2
    # verify response trả về name của data[0]
    And match response.data[0].name == "cerulean"

  Scenario: Verify response post method of create new user
    # gắn path vào url ở background
    Given path "/api/users"
    # body của API
    And request
    """
    {
    "name": "morpheus",
    "job": "leader"
    }
    """
    # sử dụng method get
    When method post
    # verify response trả về status 201
    Then status 201
    # verify response trả về dạng object
    And match response == "#object"
    # verify response trả về id not null
    And match response.id == "#notnull"
    # verify response trả về name = morpheus
    And match response.name == "morpheus"
    # verify response trả về job = leader
    And match response.job == "leader"

