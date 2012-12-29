When 'debug' do
  page.driver.debug
end

Then 'take a screen shot' do
  page.driver.render Rails.root.join('screenshot.png'), full: true
end

Then /^I wait for ([0-9]+(?:\.[0-9]+)?) seconds?$/ do |delay|
  sleep delay.to_f
end

Then 'I pause' do
  puts "Press ENTER to continue."
  STDIN.getc
end

Then 'I print the page source to stdout' do
  puts page.source
end
