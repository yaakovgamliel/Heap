Before do
  Terminus.start_browser port: 4567 unless Terminus.browsers.any?
  Terminus.browser = :docked
  user = Fabricate(:heap_user)
  log  = Fabricate(:heaplog, user: user)
  10.times { Fabricate(:post, heaplog: log) }
end

After do
  Terminus.return_to_dock
end
