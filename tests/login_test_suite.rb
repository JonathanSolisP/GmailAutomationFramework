require 'watir-webdriver'
require '../base/base_site'

class LoginTestSuite

  def test_login_in
    '''
    Given: A user with valid credentials
    When: Request to log in Gmail
    Then: User is able to access his/her Inbox successfully
    '''
    site = BaseSite.new
    login_page = site.login_page
    login_page.open
    login_page.enter_email $USER_EMAIL
    login_page.click_next_button
    login_page.enter_password $USER_PASSWORD
    inbox_page = login_page.click_sign_in_button
    if inbox_page.is_title_displayed
      puts 'Yeey, test passed'
      inbox_page.click_compose_button
    else
      puts 'Oops, something went wrong'
    end
    #site.close
  end
end


loginTestSuite = LoginTestSuite.new
loginTestSuite.test_login_in