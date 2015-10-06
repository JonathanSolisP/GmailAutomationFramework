
class InboxPage < BrowserContainer
  TITLE = "Inbox"
  def is_title_displayed
    Watir::Wait.until(timeout = 10) { @browser.text.include? TITLE }
  end

  def click_compose_button
    compose_button.click
  end


  private
  def compose_button
    @browser.div(:class => 'T-I J-J5-Ji T-I-KE L3')
  end
end