require 'spec_helper'

driver = Selenium::WebDriver.for :firefox

describe 'show hall page' do
  it 'show load the svg tag', :js => true do
    driver.get 'http://0.0.0.0:3000/halls/1'
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { driver.find_element(:tag_name => 'svg' ) }
  end
end
