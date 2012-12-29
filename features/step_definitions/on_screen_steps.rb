Then /^I should see '(.+)'$/ do |what|
  page.source
  page.should have_content(what)
end

Then /^I should see the (\d+) posts$/ do |count|
  page.source
  expect(page.all('li.post.compact').size).to eq(count.to_i)
end
