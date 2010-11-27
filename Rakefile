require 'bundler'
require 'rake/testtask'

Bundler::GemHelper.install_tasks
Rake::TestTask.new do |t|
  t.libs << "libs"
  t.test_files = FileList["test/**/*.rb"]
  t.verbose = false
end
