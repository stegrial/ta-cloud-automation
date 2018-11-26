require 'capybara/rspec'
require 'mail'

require_relative '../pages/sign_up_page'

include Sign_up

def user_opens_sign_up_page(url)
  open_page url
end

def user_clicks_back_to_main_link
  click_by_element('sign_up:back_to_main_link', "//a[contains(., 'Back to main')]")
end

def user_sees_ta_site_page_is_opened(url)
  check_right_page_opened url
end

def user_clicks_sign_in_link
  follow_by_link('sign_up:sign_in_link', 'Sign in')
end

def user_sees_sign_in_page_is_opened(url)
  check_right_page_opened url
end

def user_fills_email_field(value)
  fill_the_field('sign_up:email_field', 'email', '')
  fill_the_field('sign_up:email_field', 'email', value)
end

def user_presses_sign_up_button
  press_button('sign_up:sign_up_button', 'Sign Up')
end

def user_is_not_registered_and_sees_notification(text)
  check_right_page_opened 'http://app-dev.trueautomation.io/auth/signup'
  check_text_is_displayed text
end

def user_is_registered_and_sees_notification(text)
  Mail.defaults do
    retriever_method :pop3, :address    => "pop.gmail.com",
                     :port       => 995,
                     :user_name  => 'trueautomation.project',
                     :password   => '123-654-789',
                     :enable_ssl => true
  end
  user_email = Mail.last.to
  puts user_email
  # expect user_email.to eq @email

  # check_right_page_opened 'http://app-dev.trueautomation.io/auth/signup'
  # check_text_is_displayed text

  # settings['number'] = settings['number'].to_i + 1
  # File.write("helгpers/data/#{current_env}.yml", settings.to_yaml)
end

def user_clicks_registration_link_from_email
  Mail.defaults do
    retriever_method :pop3, :address    => "pop.gmail.com",
                     :port       => 995,
                     :user_name  => 'trueautomation.project',
                     :password   => '123-654-789',
                     :enable_ssl => true
  end
  link = Mail.last.body.match(/http:.+$/)[0]
  open_page link
end

def then_password_creation_page_is_opened

end