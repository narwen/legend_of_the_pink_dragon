Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should be on that admin location page$/ do
  current_path.should == admin_location_path(Location.last)
end
