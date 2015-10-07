require '../configs/base_framework_configs'
require '../driver/browser_container'
require '../page_objects/login_page'


class BaseSite < BrowserContainer
  def initialize
    if $BROWSER == BrowserType.FIREFOX
      super(Watir::Browser.new)
    else if $BROWSER == BrowserType.CHROME
    super(Watir::Browser.new :chrome)
         end
    end
    @browser.window.resize_to 1920, 1080
    @browser.window.move_to 0, 0
  end

  def login_page
    @login_page = LoginPage.new @browser
  end

  def inbox_page
    @inbox_page = InboxPage.new @browser
  end

  def send_email_page
    @send_email_page = SendEmailPage.new @browser
  end

  def wait_until_title_equals(title)
    Watir::Wait.until { @browser.title.include? title }
  end

  def close
    @browser.close
  end
end