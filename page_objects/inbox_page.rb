require 'rubygems'
require 'rspec'
require 'watir-webdriver'

class InboxPage < BrowserContainer
  TITLE = "Inbox"

  def enter_receiver(receiver)
    receiver_input.set receiver
  end

  def enter_subject(subject)
    subject_input.set subject
  end

  def click_receiver
    receiver_div.click
  end

  def click_compose_button
    compose_button.click
  end

  def exists_compose_button
    until compose_button.exists? do  end
    compose_button.exists?
  end

  def title
    TITLE
  end

  private
  def compose_button
    @browser.div(:class => 'T-I J-J5-Ji T-I-KE L3')
  end

  def receiver_div
    @browser.div(:id => ':aj').wait_until_present(timeout = 5)
  end

  def receiver_input
    @browser.text_field(:id => ':ao').wait_until_present(timeout = 5)
  end

  def subject_input
    @browser.text_field(:id => ':a9').wait_until_present(timeout = 5)
  end

  def email_on_list
    @browser.div(:id => ':37')
  end
end