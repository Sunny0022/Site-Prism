require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.register_driver(:firefox) do |app|
  Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
      url: ENV.fetch('SELENIUM_URL'),
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.firefox
  )
end
