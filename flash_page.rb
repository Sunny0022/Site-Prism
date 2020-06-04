require 'site_prism'
require 'rspec'
require 'capybara/cucumber'

class FlashPage < SitePrism::Page
  set_url 'http://shubham.domain4now.com/users/new'

  element :Name, '[id="user_name"]'
  element :Email, '[id="user_email"]'
  element :Password, '[id="user_password"]'
  element :Confirm_password, '[id="user_password_confirmation"]'
  element :button, 'button[type="submit"]'

  def populate(**attrs)
    Name.set attrs[:Name]
    Email.set attrs[:Email]
    Password.set attrs[:Password]
    Confirm_password.set attrs[:Confirm_password]
  end

  def send
    button.click
  end
end
class Login < SitePrism::Page
  element :login, '[css=".btn"]'

  def page_visible
    login.text
  end
end
