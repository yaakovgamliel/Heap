require 'uri'

When /^I visit '(.+)'$/ do |uri|
  visit uri
end

Then /^I am redirected to '(.+)'$/ do |path|
  page.current_url # apparently calling current_url twice stops it returning nil. WAT?
  page.current_url # this second comment is to point out how annoying it is to lose most of boxing-day because of it.
  page.current_path.should eq(path)
end

When 'I go to the user\'s page' do
  step "I visit '#{user_summary_path @user}'"
end
