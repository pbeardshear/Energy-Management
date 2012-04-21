require 'spec_helper'

driver = Selenium::WebDriver.for :firefox

describe 'tips index page' do
  it 'should show tips correctly', :js => true do
    tips_page = 'http://0.0.0.0:3000/tips'
    list_item_selector = 'div[value="open"] li'

    driver.get tips_page

    # This looks at the test database and not the actual one that selenium test so I cant do this without
    # making selenium use the test database but there are conflicts with rspec when trying to run with the test database
    # @categories = {}
    # Build up the possible categories
    # Tip.all.each do |tip|
    #   tip.categories.each do |category|
    #     @categories[category.name] = [] unless @categories[category.name]
    #     @categories[category.name].push(tip)
    #   end
    # end

    wait10 = Selenium::WebDriver::Wait.new(:timeout => 10)
    driver.find_elements(:css => 'div.ui-content > ul[data-rol="listview"] > li').size.should == 0

    driver.find_element(:css => 'h3.Category_Lab').click
    wait10.until { driver.find_elements(:css => list_item_selector).size == 22 }
    # @categories["Lab"].size }
      
    driver.find_element(:css => 'h3.Category_Office').click
    wait10.until { driver.find_elements(:css => list_item_selector).size == 22 + 24 }
    # @categories["Lab"].size + @categories["Office"].size 

    driver.find_element(:css => 'h3.Category_Lab').click
    wait10.until { driver.find_elements(:css => list_item_selector).size == 24 } 
    # @categories["Office"].size 

    driver.find_element(:css => 'h3.Category_Office').click
    wait10.until { driver.find_elements(:css => list_item_selector).size == 0 }
    driver.close
  end
end
