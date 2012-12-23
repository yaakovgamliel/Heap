Then /^I should see '(.+)'$/ do |what|
  page.should have_content(what)
end
