require 'spec_helper'

driver = Selenium::WebDriver.for :firefox

describe 'The admin tips' do
  before do
  end

  it 'should be able to create new tips' do
    # turn this into cucumber instead?

    driver.get 'http://0.0.0.0:3000/admin/tips/'
    
    # there should already be tips
    assert driver.find_elements(:css => 'table > tbody > tr').size != 0

    # there should not be the tip titled 'selenium', if there does delete them
    while driver.find_elements(:css => 'table > tbody > tr > td > a').select { |tag| tag.text.include? 'selenium' }.size != 0
      # delete the the tip
      driver.find_elements(:css => 'table > tbody > tr > td > a').select { |tag| tag.text.include? 'selenium' }[0].click
      driver.find_element(:css => 'button').click
      driver.find_element(:css => ".btn-danger").click
      driver.get 'http://0.0.0.0:3000/admin/tips/'
    end

    # create a new tip
    driver.find_element(:css => '.btn').click
    driver.find_element(:id => 'tip_title').send_keys "selenium"
    driver.find_element(:id => 'categories_General').click
    content1 = 'this is a test content, you should never see this'
    driver.find_element(:id => 'tip_content').send_keys content1
    driver.find_element(:css => ".btn-success").click
    driver.get 'http://0.0.0.0:3000/admin/tips/'

    # make sure the tip exist in the home page now
    assert driver.find_elements(:css => 'table > tbody > tr > td').select { |tag| tag.text.include? content1 }.size.should == 1
    
    # modify the tip
    element = driver.find_elements(:css => 'table > tbody > tr > td > a').select { |tag| tag.text.include? 'selenium' }[0]
    element.click
    driver.find_element(:css => 'button').click
    content2 = ', ok this is an addition to the content'
    driver.find_element(:id => 'tip_content').send_keys content2
    driver.find_element(:css => ".btn-success").click
    driver.get 'http://0.0.0.0:3000/admin/tips/'    

    # check if the modification has been saved
    assert driver.find_elements(:css => 'table > tbody > tr > td').select { |tag| tag.text.include? content1 + content2 }.size.should == 1

    # delete the the tip
    driver.find_elements(:css => 'table > tbody > tr > td > a').select { |tag| tag.text.include? 'selenium' }[0].click
    driver.find_element(:css => 'button').click
    driver.find_element(:css => ".btn-danger").click
    driver.get 'http://0.0.0.0:3000/admin/tips/'    
    
    # make sure that tag is empty
    assert driver.find_elements(:css => 'table > tbody > tr > td').select { |tag| tag.text.include? content1 + content2 }.size.should == 0
  end
end
