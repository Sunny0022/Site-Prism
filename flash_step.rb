require_relative 'flash_page.rb'

Given(/^We are on FlashSale signup form$/) do
  @create = FlashPage.new
  @create.load
end

When(/^I fill the form$/) do
  @create.populate
  (
  Name :Test
  Email :'test_me@domain.com'
  Password :'Test123,./'
  Confirm_password :'Test123,./'
  )
end

Then(/^I display result$/) do
  @create.send
end
