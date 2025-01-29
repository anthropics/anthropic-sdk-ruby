# frozen_string_literal: true

require "minitest/test_task"
require "rake/clean"
require "rubocop/rake_task"
require "securerandom"
require "shellwords"

CLEAN.push(*%w[.idea/ .ruby-lsp/ .yardoc/])

xargs = %w[xargs --no-run-if-empty --null --max-procs=0 --max-args=300 --]

task(default: [:test, :format])

Minitest::TestTask.create do |t|
  t.libs = %w[.]
  t.test_globs = ENV.fetch("TEST", "./test/**/*_test.rb")
end

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = %w[--fail-level E --autocorrect]
  if ENV.key?("CI")
    t.options += %w[--format github]
  end
end

multitask(:format_rb) do
  find = %w[find ./lib ./test ./rbi -type f -and ( -name *.rb -or -name *.rbi ) -print0]
  fmt = xargs + %w[rubocop --fail-level F --autocorrect --format simple --]
  sh("#{find.shelljoin} | #{fmt.shelljoin}")
end

multitask(:format_rbs) do
  find = %w[find ./sig -type f -name *.rbs -print0]
  inplace = /darwin|bsd/ =~ RUBY_PLATFORM ? %w[-i''] : %w[-i]
  uuid = SecureRandom.uuid

  # `syntax_tree` has trouble with `rbs`'s class aliases

  sed = xargs + %w[sed -E] + inplace + %w[-e]
  # annotate class aliases with a unique comment
  pre = sed + ["s/class ([^ ]+) = (.+$)/# #{uuid}\\n\\1: \\2/", "--"]
  fmt = xargs + %w[stree write --plugin=rbs --]
  # remove the unique comment and transform class aliases to type aliases
  subst = <<~SED
    # delete the unique comment
    s/# #{uuid}//
    # if deletion happened, branch to label `l1`, else continue
    t l1
    b
    # transform the class alias to a type alias at label `l1`
    : l1
    n
    s/([^ :]+): (.+$)/class \\1 = \\2/
  SED
  pst = sed + [subst, "--"]

  # transform class aliases to type aliases, which syntax tree has no trouble with
  sh("#{find.shelljoin} | #{pre.shelljoin}")
  # run syntax tree to format `*.rbs` files
  sh("#{find.shelljoin} | #{fmt.shelljoin}")
  # transform type aliases back to class aliases
  sh("#{find.shelljoin} | #{pst.shelljoin}")
end

multitask(format: [:format_rb, :format_rbs])

multitask(:steep) do
  sh(*%w[steep check])
end

multitask(:sorbet) do
  sh(*%w[srb typecheck -- .], chdir: "./rbi")
end

multitask(typecheck: [:steep, :sorbet])
multitask(lint: [:rubocop, :typecheck])

multitask(:build) do
  sh(*%w[gem build -- anthropic.gemspec])
end

multitask(release: [:build]) do
  sh(*%w[gem push], *FileList["anthropic-*.gem"])
end
