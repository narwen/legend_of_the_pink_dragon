When /^I click "([^"]*)" within the "([^"]*)" unlinked location$/ do |link_text, location|
  location_id = Location.find_by_name(location).id
  within(".unlinked_location_#{location_id}") do
    click_link(link_text)
  end
end

Then /^I should not see "([^"]*)" within unlinked locations$/ do |content|
  within(".unlinked_locations") do
    page.should have_no_content(content)
  end
end
