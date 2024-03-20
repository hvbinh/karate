Feature: login then verify text in

  Scenario: Verify that login successfully
    # khởi tạo trình duyệt và mở url https://www.saucedemo.com
    Given driver "https://www.saucedemo.com/"
    # nhập username: standard_user
    When input("//input[@name='user-name']","standard_user")
    # nhập password: secret_sauce
    And input("//input[@name='password']","secret_sauce")
    # click nút login
    And click("//input[@name='login-button']")
    # chờ burger menu hiển thị sau đó click
    And waitFor("//button[@id='react-burger-menu-btn']").click()
    # click vào about menu
    And click("//a[@id='about_sidebar_link']")
    # verify text của nút bằng 'Request a demo'
    Then match text("//a[@href='/request-demo']/button") == "Request a demo"

