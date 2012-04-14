When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in field, with: value
end

When /^I fill in "([^"]*)" with:$/ do |field, string|
  fill_in field, with: string
end

When /^I click "([^"]*)"$/ do |text|
  click_button text
end

When /^I click the link "([^"]*)"$/ do |link|
  click_link link
end

Then /^I should see a ([a-zA-Z]+) of "([^"]*)"$/ do |flash_type, content|
  within(".flash-#{flash_type}") do
    page.should have_content(content)
  end
end

Then /^I should see "([^"]*)"$/ do |content|
  page.should have_content(content)
end

Then /^I should not see "([^"]*)"$/ do |content|
  page.should have_no_content(content)
end

Then /^Show me the page$/ do 
  save_and_open_page
end
