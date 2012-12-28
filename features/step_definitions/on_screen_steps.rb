Then /^I should see '(.+)'$/ do |what|
  page.source
  page.should have_content(what)
end
