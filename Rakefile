# frozen_string_literal: true

require "minitest/test_task"
require "rake/clean"
require "rubocop/rake_task"
require "securerandom"
require "shellwords"

CLEAN.push(*%w[.idea/ .ruby-lsp/ .yardoc/])

task(default: [:test, :format])

Minitest::TestTask.create do |t|
  t.libs = %w[.]
  t.test_globs = ENV.fetch("TEST", "test/**/*_test.rb")
end

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = %w[--fail-level E --autocorrect]
  if ENV.key?("CI")
    t.options += %w[--format github]
  end
end

multitask(:format) do
  find = %w[find lib test -name *.rb -print0]
  xargs = %w[xargs --no-run-if-empty --null --max-procs=0 --max-args=300 --]
  fmt = %w[rubocop --fail-level F --autocorrect --format simple --]
  sh("#{find.shelljoin} | #{xargs.shelljoin} #{fmt.shelljoin}")
end

multitask(lint: [:rubocop])

multitask(:build) do
  sh(*%w[gem build -- anthropic.gemspec])
end

multitask(release: [:build]) do
  sh(*%w[gem push], *FileList["anthropic-*.gem"])
end
