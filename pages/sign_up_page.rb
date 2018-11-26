require 'capybara/rspec'
require 'selenium-webdriver'

module Sign_up

  def open_page(url)
    page.visit url
  end

  def follow_by_link(ta_locator, link)
    click_link(ta(ta_locator, link))
  end

  def click_by_element(ta_locator, element_locator)
    find(:xpath, ta(ta_locator, element_locator)).click
  end

  def check_right_page_opened(url)
    expect(page).to have_current_path(url, url: true)
  end

  def fill_the_field(ta_locator, field, value)
    fill_in(ta(ta_locator, field), with: value)
  end

  def press_button(ta_locator, button)
    click_button(ta(ta_locator, button))
  end

  def check_text_is_displayed(text)
    expect(page).to have_text(text)
  end




end