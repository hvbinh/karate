Feature: login
  Scenario: Verify that login successfully
    Given driver "https://www.saucedemo.com/"
    When input("//input[@name='user-name']","standard_user")
    And input("//input[@name='password']","secret_sauce")
    And click("//input[@name='login-button']")
    And waitFor("//button[@id='react-burger-menu-btn']").click()
    And click("//a[@id='inventory_sidebar_link']")
    Then match text("//div[@class='app_logo']") == "Swag Labs"
