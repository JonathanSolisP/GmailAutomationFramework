require 'rubygems'
require 'rspec'
require 'watir-webdriver'

class InboxPage < BrowserContainer
  TITLE = "Inbox"

  def click_email_on_list
    email_on_list.click
  end

  def click_compose_button
    compose_button.click
    SendEmailPage.new @browser
  end

  def exists_compose_button
    until compose_button.exists? do  end
    compose_button.exists?
  end

  def exists_back_button
    until back_button.exists? do  end
    back_button.exists?
  end

  def title
    TITLE
  end

  private
  def compose_button
    @browser.div(:class => 'T-I J-J5-Ji T-I-KE L3')
  end

  def email_on_list
    @browser.tr(:id => ':37')
  end

  def back_button
    @browser.div(:class => 'T-I J-J5-Ji lS T-I-ax7   ar7')
  end
end