Given /^I am a authenticated user$/ do
  @user = Fabricate(:user)
  visit sign_in_path
  fill_in "Username", with: @user.username
  fill_in "Password", with: "secret"
  click_button "Login"
end

Given /^I am a authenticated admin$/ do
  @user = Fabricate(:admin)
  visit sign_in_path
  fill_in "Username", with: @user.username
  fill_in "Password", with: "secret"
  click_button "Login"
end

Then /^I should not see the welcome message$/ do
  page.should have_no_content("Welcome, #{@user.username}")
end
