Given /I am viewing "(.*)" hall/ do |hall|
end

When /I select "(.*)" from the time interval dropdown/ do |interval|
end

Then /I should see the usage graph for the past week/ do
end

# Above is all we need to do for the dashboard

When /I select "(.*)" from the Operational Unit dropdown/ do |op|
end

Then /I should see "(.*)"* hall under the pinned tab/ do |hall|
end

Given /the following halls are favorites: "(.*)"/ do |halls|
  #halls.split(',')
end

And /I search for "(.*)" hall/ do |hall|
end
