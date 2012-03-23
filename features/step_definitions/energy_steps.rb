# -*- coding: utf-8 -*-
Given /I am viewing "(.*)" hall/ do |hall|
  pending
end

When /I select "(.*)" from the time interval dropdown/ do |interval|
  pending
end

Then /I should see the usage graph for the past week/ do
  pending
end

# Above is all we need to do for the dashboard

When /I select "(.*)" from the Operational Unit dropdown/ do |op|
  pending
end

Then /I should see "(.*)"* hall under the pinned tab/ do |hall|
  pending
end

Then /I should not see "(.*)"* hall under the pinned tab/ do |hall|
  pending
end

Given /the following halls are favorites: (.*)/ do |halls|
  #halls.split(',')
  pending
end

And /I search for "(.*)" hall/ do |hall|
  pending
end

Then /^I should see the tip for "(.*)"$/ do |hall|
  pending
end

Then /^I should not see the tip for "(.*)"$/ do |hall|
  pending
end

Given /^I work in an office$/ do
  pending
end

Given /^I am in the residence halls$/ do
  pending
end

Then /^I should see "(.*)" hall$/ do |hall|
  pending
end

Then /^I should not see "(.*)" hall$/ do |hall|
  pending
end

Then /^I should see no Halls$/ do
  pending
end
