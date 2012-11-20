require 'guard/jasmine/task'

Guard::JasmineTask.new do |task|
  task.options = '-t 15 -e test'
end
