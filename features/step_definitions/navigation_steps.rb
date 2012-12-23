require 'uri'

When /^I visit '(.+)'$/ do |uri|
  visit uri
end

Then /^I am redirected to '(.+)'$/ do |uri|
  parsed_uri = URI(page.current_url)
  parsed_uri.path.should eq(uri)
end
