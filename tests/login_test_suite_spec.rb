require 'rubygems'
require 'rspec'
require 'watir-webdriver'
require '../base/base_site'


describe '.authenticate' do
  let (:site) { BaseSite.new}
  before { site.login_page.open }
  after { site.close }

  it 'display inbox page if logged in' do
    login_page = site.login_page
    login_page.enter_email $USER_EMAIL
    login_page.click_next_button
    login_page.enter_password $USER_PASSWORD
    inbox_page = login_page.click_sign_in_button
    expect(inbox_page.exists_compose_button).to eq(true)

    '''browser.text_field(:name => "q").set "watir"
    browser.button.click
    browser.div(:id => "resultStats").wait_until_present
    expect(browser.title).to eq("watir - Buscar con Google")'''
  end

  it 'display error message when password is incorrect' do
    login_page = site.login_page
    login_page.enter_email $USER_EMAIL
    login_page.click_next_button
    login_page.enter_password $USER_INVALID_PASSWORD
    login_page.click_sign_in_button
    expect(login_page.exists_error_password_not_valid_label).to eq(true)
  end
end