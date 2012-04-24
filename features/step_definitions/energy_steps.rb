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

# Given /I am viewing "(.*)" hall/ do |hall|
#   pending
# end

# When /I select "(.*)" from the time interval dropdown/ do |interval|
#   pending
# end

# When /I select "(.*)" from the Operational Unit dropdown/ do |op|
#   pending
# end

 And /I search for "(.*)" hall/ do |hall|
    find(".ui-listview-filter input").set(hall)
 end

# Then /I should see "(.*)"* hall under the pinned tab/ do |hall|
#   pending
# end

# Then /I should not see "(.*)"* hall under the pinned tab/ do |hall|
#   pending
# end

Given /^I (?:un)?pin "(.*)"$/ do |hall|
  step %Q{I follow "Pin"}
  step %Q{I follow "#{hall}"}
  step %Q{I follow "Pin"}
end

Then /^I should see "(.*)" hall pinned$/ do |hall|
  # page.find("li-pinned").find(hall)

  # The above is not really testing much, it just test if
  # the an element has a class, but what we really want to check
  # should be more behavioral, for instance... the hall is in
  # the list of pinned halls assuming that there will exist an 
  # seperation in the future. In any case there should be a page
  # change in which is should be able to test even if it is
  # "I should see pinned building above of unpinned buildings"
  pending
end

Then /^I should see the following halls pinned: "(.*)"$/ do |halls|
  halls.split(',').each do |hall|
    step %Q{I should see "#{hall}" hall pinned}
  end
end

# Then /^I should see the tip for "(.*)"$/ do |hall|
#   pending
# end

# Then /^I should not see the tip for "(.*)"$/ do |hall|
#   pending
# end

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
    hall_not_hidden = true
    page.all(:css, ".ui-screen-hidden .ui-btn-inner .ui-btn-text .ui-link-inherit .hall-name").each do |elt|
      if elt.has_content?(hall)
        hall_not_hidden = false
      end
    end
    hall_not_hidden.should be_true
  end

  Then /^I should not see "(.*)" hall$/ do |hall|
    hall_hidden = false
    page.all(:css, ".ui-screen-hidden .ui-btn-inner .ui-btn-text .ui-link-inherit").each do |elt|
      if elt.has_content?(hall)
        hall_hidden = true
      end
    end
    hall_hidden.should be_true
 end

# Then /^I should see no halls$/ do
#   pending
# end

# Then /I should see the usage graph for the past week/ do
#   pending
# end

Then /I should see (\d+) tips$/ do |amount|
  page.all("div[value='open'] li").count.should == Integer(amount)
end

Then /I should see the "(.*)" selector eventually$/ do |selector|
  wait_until do
    page.find selector
  end
end

