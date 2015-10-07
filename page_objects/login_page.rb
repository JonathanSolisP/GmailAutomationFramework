require '../configs/base_framework_configs'
require '../driver/browser_container'
require '../page_objects/inbox_page'

class LoginPage < BrowserContainer
  URL = $BASE_URL

  def open
    @browser.goto URL
    self
  end

  def enter_email(email)
    email_input.set email
  end

  def enter_password(password)
    password_input.set password
  end

  def click_next_button
    next_button.when_present.click
  end

  def click_sign_in_button
    sign_in_button.click
    InboxPage.new(@browser)
  end

  def exists_error_password_not_valid_label
    until error_password_not_valid_label.exists? do  end
    error_password_not_valid_label.exists?
  end

  def exists_error_username_not_valid_label
    until error_username_not_valid_label.exists? do  end
    error_username_not_valid_label.exists?
  end

  private
  def email_input
    @browser.text_field(:id => 'Email')
  end
  def password_input
    if Watir::Wait.until { @browser.text.include? 'No cerrar' }
      @browser.text_field(:id => 'Passwd')
    end
  end
  def next_button
    @browser.button(:id => 'next')
  end
  def sign_in_button
    @browser.button(:id => 'signIn')
  end
  def error_password_not_valid_label
    @browser.span(:id => 'errormsg_0_Passwd')
  end
  def error_username_not_valid_label
    @browser.span(:id => 'errormsg_0_Email')
  end

end