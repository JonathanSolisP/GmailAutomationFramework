require '../configs/base_framework_configs'
require '../driver/browser_container'
require '../page_objects/login_page'


class BaseSite < BrowserContainer
  def initialize
    if $BROWSER == BrowserType.FIREFOX
      super(Watir::Browser.new)
    end
  end

  def login_page
    @login_page = LoginPage.new(@browser)
  end

  def close
    @browser.close
  end
end