require 'capybara/cucumber'
require 'test/unit'
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
end

When(/^I go to the store page to buy credit packs$/) do
  @buy = BuyPackPage.new
  @buy.load
  @buy.buy_item
end

And(/^I fill the (.*), (.*) and (.*) details$/) do |account, dat, cvv|
  @pay = PaymentPage.new
  @pay.load
  @pay.fill_stripe_elements(account, dat, cvv)
  Capybara.default_max_wait_time = 2
  click_button 'Submit Payment'
  Capybara.default_max_wait_time = 10
end

Then(/^The transaction should be successful$/) do
  expect(page).to have_content 'The transaction is successful, thanks for purchase!'
  Capybara.default_max_wait_time = 5
  @pay.logout
  Capybara.default_max_wait_time = 2
end

Then(/^The transaction should not be successful$/) do
  expect(@pay.error).to have_content('Your card number is incomplete.')
  @pay.logout
  Capybara.default_max_wait_time = 2
end

Then(/^The transaction should be declined$/) do
  expect(@pay.declined).to have_content 'Transaction failed, Your card was declined'
  Capybara.default_max_wait_time = 5
  @pay.logout
end
