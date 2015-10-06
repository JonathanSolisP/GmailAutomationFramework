require 'rubygems'
require 'rspec'
require 'watir-webdriver'

class InboxPage < BrowserContainer
  TITLE = "Inbox"

  def click_compose_button
    compose_button.click
  end

  def exists_compose_button
    until compose_button.exists? do  end
    compose_button.exists?
  end

  private
  def compose_button
    @browser.div(:class => 'T-I J-J5-Ji T-I-KE L3')
  end
end