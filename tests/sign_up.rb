require 'spec_helper'

require_relative '../step_definitions/sign_up_def.rb'


describe 'Preconditions' do

  before (:each) do
    @email = [settings['username'], settings['number'], current_env, settings['domain']].join('')
    # user_opens_sign_up_page settings['sign_up_page']
  end

  after (:all) do

    # settings['number'] = settings['number'].to_i + 1
    # File.write("helpers/data/#{current_env}.yml", settings.to_yaml)
  end

  feature 'Sign up page' do

    scenario 'Back to main link' do
      user_opens_sign_up_page settings['sign_up_page']
      user_clicks_back_to_main_link
      user_sees_ta_site_page_is_opened 'https://trueautomation.io/'
    end

    scenario 'Sign in link' do
      user_opens_sign_up_page settings['sign_up_page']
      user_clicks_sign_in_link
      user_sees_sign_in_page_is_opened settings['sign_in_page']
    end

    # scenario 'Sign up form' do
    #   user_opens_sign_up_page settings['sign_up_page']
    #   user_presses_sign_up_button
    #   user_is_not_registered_and_sees_notification 'Email address is required.'
      user_fills_email_field 'usernamegmail.com'
    #   user_presses_sign_up_button
    #   # user_is_not_registered_and_sees_notification 'Please use a valid email address to sign up. We will send you activation instructions there.'
    #   user_fills_email_field 'user@name@gmail.com'
    #   user_presses_sign_up_button
    #   # user_is_not_registered_and_sees_notification 'Please use a valid email address to sign up. We will send you activation instructions there.'
    #   user_fills_email_field '@gmail.com'
    #   user_presses_sign_up_button
    #   # user_is_not_registered_and_sees_notification 'Please use a valid email address to sign up. We will send you activation instructions there.'
    #   user_fills_email_field 'username@gmail'
    #   user_presses_sign_up_button
    #   user_is_not_registered_and_sees_notification 'Please use a valid email address to sign up. We will send you activation instructions there.'
    #   user_fills_email_field 'username@gmail.'
    #   user_presses_sign_up_button
    #   # user_is_not_registered_and_sees_notification 'Please use a valid email address to sign up. We will send you activation instructions there.'
    #   user_fills_email_field 'trueautomation.project@gmail.com'
    #   user_presses_sign_up_button
    #   user_is_not_registered_and_sees_notification 'User with this email is already registered.'
    #   user_fills_email_field @email
    #   user_presses_sign_up_button
    #   user_is_registered_and_sees_notification 'Thanks for requesting TrueAutomation.io account.'
    #   user_clicks_back_to_main_link
    #   user_sees_ta_site_page_is_opened 'https://trueautomation.io/'
    # end
    #
    # scenario 'Sign up process' do
    #   # user_opens_sign_up_page settings['sign_up_page']
    #   # user_fills_email_field @email
    #   # user_presses_sign_up_button
    #   user_is_registered_and_sees_notification 'Thanks for requesting TrueAutomation.io account.'
      user_clicks_registration_link_from_email
    #   sleep 5
    #   # then_password_creation_page_is_opened
    #   # user_presses_sign_up_button
    #   # user_fills_password_field ''

    # end



  end
end