Before do
  user = Fabricate(:heap_user)
  log  = Fabricate(:heaplog, user: user)
  10.times { Fabricate(:post, heaplog: log) }
  Capybara.current_driver = :poltergeist
end
