require 'spec_helper'

driver = Selenium::WebDriver.for :firefox

describe 'show hall page' do
  it 'load the svg tag, and load the proper interval', :js => true do
    driver.get 'http://0.0.0.0:3000/halls/1'
    wait10 = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait10.until { driver.find_element(:tag_name => 'svg' ) }
    
    # the script tag's source should have 'week' inside of it
    assert driver.find_elements(:tag_name => 'script').any? { |script|
      script[:src].include? "week"
    }

    # the week button should be highlighted
    assert driver.find_element(:css => "a.intervalSelection.ui-btn-active > .ui-btn-inner").text == "Week"
    
    # click the month button
    driver.find_elements(:css => "a.intervalSelection > .ui-btn-inner").each { |tag| 
      if tag.text == "Month"
        tag.click
      end
    }

    wait10.until { driver.find_element(:tag_name => 'svg' ) }

    # the script tag's source should have 'week' inside of it
    assert driver.find_elements(:tag_name => 'script').any? { |script|
      script[:src].include? "month"
    }

    # the week button should be highlighted
    assert driver.find_element(:css => "a.intervalSelection.ui-btn-active > .ui-btn-inner").text == "Month"
    driver.close
  end
end
