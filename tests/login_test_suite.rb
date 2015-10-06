require '../base/base_site'

class LoginTestSuite
  def initialize
    @site = BaseSite.new
  end

  def test_login_in
    login_page = @site.login_page
    login_page.open
    login_page.enter_email $USER_EMAIL
    login_page.click_next_button
    login_page.enter_password $USER_PASSWORD
    inbox_page = login_page.click_sign_in_button
    if inbox_page.is_title_displayed
      puts 'Yeey, test passed'
      inbox_page
    else
      puts 'Oops, something went wrong'
    end
  end

  def close_browser
    @site.close
  end
end


loginTestSuite = LoginTestSuite.new
loginTestSuite.test_login_in
loginTestSuite.close_browser