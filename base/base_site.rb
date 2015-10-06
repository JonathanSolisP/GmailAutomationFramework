require '../configs/base_framework_configs'
require '../driver/browser_container'
require '../page_objects/login_page'


class BaseSite < BrowserContainer
  def initialize
    if $BROWSER == BrowserType.FIREFOX
      super(Watir::Browser.new)
      @browser.window.resize_to 1920, 1080
      @browser.window.move_to 0, 0
    end
  end

  def login_page
    @login_page = LoginPage.new @browser
  end

  def inbox_page
    @inbox_page = InboxPage.new @browser
  end

  def get_browser_title
    Watir::wait
    @browser.title
  end

  def close
    @browser.close
  end
end