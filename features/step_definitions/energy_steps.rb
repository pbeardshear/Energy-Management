Given /the following tips exist/ do |tip_table|
  tip_table.hashes.each do |tip|
    Tip.new(tip).save
  end
end

Given /the following category_tips exist/ do |category_tips_table|
  category_tips_table.hashes.each do |category_tip|
    CategoryTip.new(category_tip).save
  end
end


Given /the following categories exist/ do |category_table|
  category_table.hashes.each do |category|
    Category.new(category).save
  end
end

Given /the following halls exist/ do |hall_table|
  hall_table.hashes.each do |hall|
    Hall.new(hall).save
  end
end

Given /^I am not authenticated$/ do
  visit('/admins/sign_out') # ensure that at least
end

Given /^I am a new authenticated user$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  Admin.new(:email => email, :password => password, :password_confirmation => password).save!

  visit '/admins/sign_in'
  fill_in "admin_email", :with=>email
  fill_in "admin_password", :with=>password
  click_button "Sign In"
end

And /^I fill the editor with "(.*)"$/ do |content|
  page.execute_script("$('iframe').contents().find('body').html('#{content}')")
end

When /^I click on "(.*)" hall/ do |hall|
  click_on hall
end

And /I search for "(.*)" hall/ do |hall|
    find(".ui-listview-filter input").set(hall)
 end

Given /^I (un)?pin "(.*)"$/ do |unpin, hall|
  if (unpin and page.has_css?('li.li-pinned', :text => hall)) or (!unpin and page.has_no_css?('li.li-pinned', :text => hall))
    step %Q{I follow "Pin"}
    step %Q{I follow "Ok"}
    wait_until { page.find_link("#{hall}").visible? } 
    step %Q{I follow "#{hall}"}
    step %Q{I follow "End"}
  end
end

When /^I expand the tip container$/ do
  click_on "Energy Tip of the Day"
end

Then /^I should see "(.*)" hall pinned$/ do |hall|
  # This checks if a hall is pinned by looking that it has the correct image
  # checking if the hall has the correct class does not really test anything
  # that the user sees
  good = false
  page.all("img[src='/assets/pin.png'] + .hall-name", :visible=>true).each do |element|
    if element.has_content? hall
      good = true
      break
    end
  end
  assert good
end

Then /^I should not see "(.*)" hall pinned$/ do |hall|
  page.all("img[src='/assets/pin-in.png'] + .hall-name").each do |element|
    assert false if element.has_content? hall
  end
end

Then /^I should see the following halls pinned: "(.*)"$/ do |halls|
  halls.split(',').each do |hall|
    step %Q{I should see "#{hall}" hall pinned}
  end
end

# Given /^I work in an office$/ do
#   pending
# end

# Given /^I am in the residence halls$/ do
#   pending
# end

  Then /^I should see all the halls$/ do
    page.has_css?(".ui-screen-hidden").should be_false
  end

  Then /^I should see "(.*)" hall$/ do |hall|
    hall_not_hidden = false
    page.all(".hall-name", :visible => true).each do |elt|
      if elt.has_content?(hall)
        hall_not_hidden = true
        break
      end
    end
    hall_not_hidden.should be_true
  end

  Then /^I should not see "(.*)" hall$/ do |hall|
    hall_hidden = false
    page.all(".hall-name", :visible => false).each do |elt|
      if elt.has_content?(hall)
        hall_hidden = true
        break
      end
    end
    hall_hidden.should be_true
 end

Then /I should see (\d+) tips$/ do |amount|
  page.all("div li", :visible => true).count.should == Integer(amount)
end

Then /I should see the "(.*)" selector eventually$/ do |selector|
  wait_until do
    page.find selector
  end
end

Then /^I should see "(.*)" before "(.*)"$/ do |item1, item2|
  step %Q{I should see "#{item1}"}
  step %Q{I should see "#{item2}"}
  assert page.html().index(item1) < page.html().index(item2)
end

Then /^I should see one of the tips of the day$/ do
  tip = page.find('#energyTip .ui-collapsible-content', :visible => true)
  assert tip
end


