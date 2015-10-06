require '../driver/browser_type'
require 'watir-webdriver'
require '../configs/base_framework_configs'


class BrowserContainer
  def initialize(browser)
      @browser = browser
  end
end