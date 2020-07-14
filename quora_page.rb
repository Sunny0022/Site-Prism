require 'site_prism'
require 'capybara/cucumber'
class QuoraPage < SitePrism::Page

  set_url 'http://akshay.domain4now.com/login'
  element :email_id, '[id = "email"]'
  element :password, '[id = "password"]'

  def sign_in(mail_id, pass_word)
    email_id.set mail_id
    password.set pass_word
  end
end
