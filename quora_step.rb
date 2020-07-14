require 'capybara/cucumber'
require 'test-unit'
require 'selenium-webdriver'
require 'site_prism'
require "#{File.dirname(__FILE__)}/../../features/support/pages/quora_page"
require "#{File.dirname(__FILE__)}/../../features/support/pages/buypack_page"
require "#{File.dirname(__FILE__)}/../../features/support/pages/payment_page"
Capybara.default_driver = :selenium

Given(/^I am on quora site$/) do
  @page = QuoraPage.new
  @page.load
end

And(/^I login with (.*) and (.*)$/) do |email, pass|
  @page.sign_in(email, pass)
  click_button('Login')
  sleep 2
end

When(/^I go to the store page to buy credit packs$/) do
  @buy = BuyPackPage.new
  @buy.load
  @buy.buy_item
  sleep 2
end

And(/^I fill the (.*), (.*) and (.*) details$/) do |account, dat, cvv|
  @pay = PaymentPage.new
  @pay.load
  @pay.fill_stripe_elements(account, dat,cvv)
  sleep 5
  click_button 'Submit Payment'
  sleep 7
end

Then(/^The transaction should be successful$/) do
  assert page.has_content?('The transaction is successful, thanks for purchase!')
  @pay.logout
  sleep 2
end

Then(/^The transaction should not be successful$/) do
  @pay.error_message
  @pay.logout
  sleep 2
end

Then(/^The transaction should be declined$/) do
  @pay.card_declined
  @pay.logout
  sleep 2
end
