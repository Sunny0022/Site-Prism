require 'site_prism'
require 'capybara/cucumber'

class PaymentPage < SitePrism::Page

  set_url 'http://akshay.domain4now.com/packs/1/payment'
  element :acc_no, '[placeholder = "Card number"]'
  element :mm_yy, '[ placeholder = "MM / YY"]'
  element :cvc_code, '[placeholder = "CVC"]'
  element :signout, '[href = "/logout"]'
  element :error, '[id = "card-errors"]'
  element :declined, '[id = "notice"]'

  def fill_stripe_elements(account, month, cvv)
    stripe_iframe = all('iframe[name=_privateStripeFrame5]').last
    within_frame stripe_iframe do
    acc_no.set account
    mm_yy.set month
    cvc_code.set cvv
    end
  end

  def logout
    signout.click
  end
  def error_message
    error.click
  end

  def card_declined
    declined.click
  end
end
