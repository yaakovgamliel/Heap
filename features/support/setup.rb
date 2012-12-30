if ENV['BROWSER']
  Terminus.start_browser(port: 4696)
else
  Terminus.start_phantomjs port: 4696
end

Before do
  Terminus.browser = :docked
  user = Fabricate(:heap_user)
  log  = Fabricate(:heaplog, user: user)
  10.times { Fabricate(:post, heaplog: log) }
end

After do
  Terminus.return_to_dock
end
