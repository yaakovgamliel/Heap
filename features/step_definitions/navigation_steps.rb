require 'uri'

When /^I visit '(.+)'$/ do |uri|
  visit uri
end

Then /^I am redirected to '(.+)'$/ do |path|
  page.source
  page.current_path.should eq(path)
end

When 'I go to the user\'s page' do
  step "I visit '#{user_summary_path @user}'"
end
