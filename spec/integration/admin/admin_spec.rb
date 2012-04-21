require 'spec_helper'

driver = Selenium::WebDriver.for :firefox

describe 'The admin account' do

  before do
    @base = 'http://0.0.0.0:3000'
    @driver = driver
  end

  def clear
    Admin.find(:all).each do |admin|
      admin.destroy
    end
    Admin.find(:all).size.should == 0
  end

  it 'should direct us to the signup page whenver we try go to an admin related page' do
    # Make sure there are no Admins, if there are delete them all
    clear
    ['/admin', '/admin/tips', '/admin/categories'].each do |page|
      driver.get @base + page
      driver.current_url.should == @base + "/admins/sign_up"
    end
    driver.close
  end

  it 'should be able to create users and have them logged out, and not be able to go to other places' do
    clear 
    driver.get @base + '/admins/sign_up'
    driver.current_url.should == @base + "/admins/sign_up"

    driver.find_element(:css => 'input#admin_email').send_keys "test@example.com"
    driver.find_element(:css => 'input#admin_password').send_keys "foobar"
    driver.find_element(:css => 'input#admin_password_confirmation').send_keys "foobar"
    driver.find_element(:css => 'input.btn').click
    driver.current_url.should == @base + "/admin/"
    driver.get @base + "/admins/sign_out"

    ['/admin', '/admin/tips', '/admin/categories'].each do |page|
      driver.get @base + page
      driver.current_url.should == @base + "/admins/sign_in"
    end
    driver.close
  end

  it 'should direct us to sign_in page whenver we try to go to an admin related page, and an admin user is already created' do
    ['/admin', '/admin/tips', '/admin/categories'].each do |page|
      driver.get @base + page
      driver.current_url.should == @base + "/admins/sign_in"
    end
    driver.close
  end
end
