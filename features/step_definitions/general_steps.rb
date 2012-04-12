When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in field, with: value
end

When /^I click "([^"]*)"$/ do |text|
  click_button text
end

Then /^I should see a notice of "([^"]*)"$/ do |content|
  within(".flash-notice") do
    page.should have_content(content)
  end
end

Then /^I should see "([^"]*)"$/ do |content|
  page.should have_content(content)
end

Then /^Show me the page$/ do 
  save_and_open_page
end
