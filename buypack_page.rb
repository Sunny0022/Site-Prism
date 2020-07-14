require 'site_prism'
require 'capybara/cucumber'

class BuyPackPage < SitePrism::Page

  set_url 'http://akshay.domain4now.com/'
  element :buy_credit, '[id = "navPacksMenu"]'
  element :pack_page, '[href = "/packs"]'
  element :buy_pack, '[href = "/packs/1/payment"]'

  def buy_item
    buy_credit.click
    pack_page.click
    buy_pack.click
  end
end
