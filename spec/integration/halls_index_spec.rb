require 'spec_helper'

driver = Selenium::WebDriver.for :firefox

describe 'index hall page' do
  it 'should go to show page when clicking on a hall, and back', :js => true do
    hall_page = 'http://0.0.0.0:3000/halls'
    driver.get hall_page
    driver.find_element(:css => 'a[href="halls/1"]').click
    driver.current_url.should == hall_page + '/1'
    
    driver.find_element(:css => 'a[data-rel="back"]').click
    driver.current_url.should == hall_page

    driver.close
  end
end

