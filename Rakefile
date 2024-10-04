# frozen_string_literal: true

require "rake/testtask"
require "rubocop/rake_task"

task(default: [:test, :format])

Rake::TestTask.new { |t| t.pattern = "./test/**/*_test.rb" }

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = ["-a", "--fail-level", "E"]
end

task(format: [:rubocop])

task(:build) { sh(*%w[gem build -- anthropic.gemspec]) }

task(release: [:build]) { sh(*%w[gem push], *FileList["anthropic-*.gem"]) }
