require '../configs/base_framework_configs'
require '../driver/browser_container'
require '../page_objects/inbox_page'

class SendEmailPage < BrowserContainer

  def enter_receiver(receiver)
    receiver_input.set receiver
  end

  def enter_subject(subject)
    subject_input.set subject
  end

  def click_receiver
    receiver_div.click
  end

  private
  def receiver_div
    @browser.div(:id => ':aj').wait_until_present(timeout = 5)
  end

  def receiver_input
    @browser.text_field(:id => ':ao').wait_until_present(timeout = 5)
  end

  def subject_input
    @browser.text_field(:id => ':a9').wait_until_present(timeout = 5)
  end
end