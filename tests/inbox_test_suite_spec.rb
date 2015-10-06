require 'rubygems'
require 'rspec'
require 'watir-webdriver'
require '../base/base_site'

describe '.inbox' do
  let (:site) { BaseSite.new}
  before { login }
  after { site.close }

  """it 'send email' do
    inbox_page = site.inbox_page
    inbox_page.click_compose_button
    #inbox_page.click_receiver
    inbox_page.enter_subject 'test'
    #inbox_page.enter_receiver $USER_EMAIL
  end"""

  it 'display email when selected' do
    inbox_page = site.inbox_page
    inbox_page.click_compose_button

  end

end


def login
  login_page = site.login_page
  login_page.open
  login_page.enter_email $USER_EMAIL
  login_page.click_next_button
  login_page.enter_password $USER_PASSWORD
  inbox_page = login_page.click_sign_in_button
  site.wait_until_title_equals inbox_page.title
end