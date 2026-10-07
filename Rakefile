# frozen_string_literal: true

require "pathname"
require "securerandom"
require "shellwords"
require "tmpdir"

require "minitest/test_task"
require "rake/clean"
require "rubocop/rake_task"

tapioca = "sorbet/tapioca"
examples = "examples"
ignore_file = ".ignore"

FILES_ENV = "FORMAT_FILE"

CLEAN.push(*%w[.idea/ .ruby-lsp/ .yardoc/ doc/], *FileList["*.gem", "sig-joined-*/"], ignore_file)

CLOBBER.push(*%w[sorbet/rbi/annotations/ sorbet/rbi/gems/], tapioca)

multitask(:default) do
  sh(*%w[rake --tasks])
end

desc("Preview docs; use `PORT=<PORT>` to change the port")
multitask(:"docs:preview") do
  sh(*%w[yard server --reload --quiet --bind [::] --port], ENV.fetch("PORT", "8808"))
end

desc("Run test suites; use `TEST=path/to/test.rb` to run a specific test file")
multitask(:test) do
  rb =
    FileList[ENV.fetch("TEST", "./test/**/*_test.rb")]
    .map { "require_relative(#{_1.dump});" }
    .join

  ruby(*%w[-w -e], rb, verbose: false) { fail unless _1 }
end

xargs = %w[xargs --no-run-if-empty --null --max-procs=0 --max-args=300 --]
ruby_opt = {"RUBYOPT" => [ENV["RUBYOPT"], "--encoding=UTF-8"].compact.join(" ")}

filtered = ->(ext, dirs) do
  if ENV.key?(FILES_ENV)
    %w[sed -E -n -e] << "/\\.#{ext}$/p" << "--" << ENV.fetch(FILES_ENV)
  else
    (%w[find] + dirs + %w[-type f -and -name]) << "*.#{ext}" << "-print0"
  end
end

desc("Lint `*.rb(i)`")
multitask(:"lint:rubocop") do
  find = %w[find ./lib ./test ./rbi ./examples -type f -and ( -name *.rb -or -name *.rbi ) -print0]

  rubocop = %w[rubocop]
  rubocop += %w[--format github] if ENV.key?("CI")

  # some lines cannot be shortened
  rubocop += %w[--except Lint/RedundantCopDisableDirective,Layout/LineLength]

  lint = xargs + rubocop
  sh("#{find.shelljoin} | #{lint.shelljoin}")
end

norm_lines = %w[tr -- \n \0].shelljoin

desc("Format `*.rb`")
multitask(:"format:rb") do
  # while `syntax_tree` is much faster than `rubocop`, `rubocop` is the only formatter with full syntax support
  files = filtered["rb", %w[./lib ./test ./examples]]
  # `--no-parallel`: `xargs` already runs several `rubocop` processes at once and each applies its corrections itself
  # either way, so letting every one also fork a worker per CPU mainly makes peak memory grow with the core count
  fmt = xargs + %w[rubocop --fail-level F --autocorrect --no-parallel --format simple --]
  sh("#{files.shelljoin} | #{norm_lines} | #{fmt.shelljoin}")
end

desc("Format `*.rbi`")
multitask(:"format:rbi") do
  files = filtered["rbi", %w[./rbi]]
  fmt = xargs + %w[stree write --]
  sh(ruby_opt, "#{files.shelljoin} | #{norm_lines} | #{fmt.shelljoin}")
end

desc("Format `*.rbs`")
multitask(:"format:rbs") do
  files = filtered["rbs", %w[./sig]]
  inplace = /darwin|bsd/ =~ RUBY_PLATFORM ? ["-i", ""] : %w[-i]
  uuid = SecureRandom.uuid

  # `syntax_tree` has trouble with `rbs`'s class & module aliases

  sed_bin = /darwin/ =~ RUBY_PLATFORM ? "/usr/bin/sed" : "sed"
  sed = xargs + [sed_bin, "-E", *inplace, "-e"]
  # annotate unprocessable aliases with a unique comment
  pre = sed + ["s/(class|module) ([^ ]+) = (.+$)/# \\1 #{uuid}\\n\\2: \\3/", "--"]
  fmt = xargs + %w[stree write --plugin=rbs --]
  # remove the unique comment and unprocessable aliases to type aliases
  subst = <<~SED
    s/# (class|module) #{uuid}/\\1/
    t l1
    b

    : l1
    N
    s/\\n *([^:]+): (.+)$/ \\1 = \\2/
  SED
  # for each line:
  #   1. try transform the unique comment into `class | module`, if successful, branch to label `l1`.
  #   2. at label `l1`, join previously annotated line with `class | module` information.
  pst = sed + [subst, "--"]

  success = false

  # transform class aliases to type aliases, which syntax tree has no trouble with
  sh("#{files.shelljoin} | #{norm_lines} | #{pre.shelljoin}")
  # run syntax tree to format `*.rbs` files
  sh(ruby_opt, "#{files.shelljoin} | #{norm_lines} | #{fmt.shelljoin}") do
    success = _1
  end
  # transform type aliases back to class aliases
  sh("#{files.shelljoin} | #{norm_lines} | #{pst.shelljoin}")

  # always run post-processing to remove comment marker
  fail unless success
end

desc("Format everything")
multitask(format: [:"format:rb", :"format:rbi", :"format:rbs"])

# the text of one file in `sig`, ending in a newline, and the declarations in it
read_signature = ->(path) do
  text = path.read(encoding: "UTF-8")
  fail("#{path} is not valid UTF-8: save it as UTF-8") unless text.valid_encoding?
  # parse each file alone: once joined, a `class A` left open in one file and an `end` in the next would pass
  _, directives, declarations = RBS::Parser.parse_signature(RBS::Buffer.new(name: path, content: text))
  if directives.any? || text.include?("\0")
    fail(
      "#{path} has a `use` line, a `# resolve-type-names` comment or a NUL byte: remove it and write type " \
      "names in full, since all of `sig` is checked as one joined file, where it would act on other files too"
    )
  end

  [text.end_with?("\n") ? text : "#{text}\n", declarations]
end

# Temporary: `steep` validates a module again for each file that adds to it, and most files in `sig` add to
# the same few, so its time far outgrows `sig`. For now `steep` gets one file that joins them all, in its
# loading order. Once `steep` fixes that and `rbs` ships ruby/rbs#3143, upgrade and run plain `steep check`.
join_signatures = -> do
  require("rbs")

  joined = +""
  lines = 0
  lines_before = {}
  declarations = Pathname.glob("sig/**/*.rbs").select(&:file?).sort.flat_map do |path|
    text, parsed = read_signature.call(path)
    lines_before[lines] = path
    lines += text.count("\n")
    joined << text
    parsed
  end
  # `steep` must get the declarations that the files hold one by one, and no `use` line or
  # `# resolve-type-names` comment, which would act on the whole joined file
  _, directives, parsed = RBS::Parser.parse_signature(RBS::Buffer.new(name: "sig (joined)", content: joined))
  unless directives.empty? && parsed == declarations
    fail(
      "this task checks all of `sig` joined into one file, and the joined file parses differently from the " \
      "files taken one by one, so its result cannot be trusted: run `steep check` instead, which is " \
      "slower, and please open an issue"
    )
  end

  [joined, lines_before]
rescue RBS::ParsingError => e
  # without its cause, which `rake` cannot print
  fail(e.message, cause: nil)
end

desc("Typecheck `*.rbs`")
multitask(:"typecheck:steep") do
  joined, lines_before = join_signatures.call
  # made in the repository, not the system's temporary folder: `steep` finds no file in a folder named by an
  # absolute path
  Dir.mktmpdir("sig-joined-", ".") do |dir|
    dir = File.basename(dir)
    File.write("#{dir}/joined.rbs", joined)
    success = false
    # the command is not echoed: pasted by hand it would find the folder gone, check nothing and pass
    warn("steep check (on all of `sig`, joined into one file)")
    env = {"STEEP_SIGNATURE_DIR" => dir}
    sh(env, *%w[steep check --jobs 1], out: "#{dir}/report", verbose: false) { success = _1 }

    report = File.read("#{dir}/report", encoding: "UTF-8")
    report.gsub!(%r{#{Regexp.escape(dir)}/joined\.rbs:(\d+)}) do
      line = Regexp.last_match(1).to_i
      before, path = lines_before.reverse_each.find { |count, _| count < line }
      "#{path}:#{line - before}"
    end
    # `steep` repeats a finding for every class that inherits the mistake: drop the repeats, and its line
    # `Detected N problems`, which counts them
    puts(report.split("\n\n").uniq.grep_v(/\ADetected \d+ problem/).join("\n\n"))
    fail("`steep check` failed") unless success
    # `steep` passes when it finds nothing to check, and prints a dot per file: a lone dot is the joined file
    unless report.match?(/^\.$/)
      fail(
        "`steep check` passed, but did not check just the one file that joins all of `sig`, so the pass " \
        "means nothing: the Steepfile's only `signature` line must be " \
        "`signature(ENV.fetch(\"STEEP_SIGNATURE_DIR\", \"sig\"))`, it must have no `check` line, and the " \
        "path of this repository must hold none of `[]{}*?\\`"
      )
    end
  end
end

directory(examples)

desc("Typecheck `*.rbi`")
multitask("typecheck:sorbet": examples) do
  sh(*%w[srb typecheck --dir], examples)
end

directory(tapioca) do
  sh(*%w[tapioca init])
end

desc("Typecheck everything")
multitask(typecheck: [:"typecheck:steep", :"typecheck:sorbet"])

desc("Lint and typecheck")
multitask(lint: [:"lint:rubocop", :typecheck])

desc("Build yard docs")
multitask(:"build:docs") do
  sh(*%w[yard])
end

desc("Build ruby gem")
multitask(:"build:gem") do
  # optimizing for grepping through the gem bundle: many tools honour `.ignore` files, including VSCode
  #
  # both `rbi` and `sig` directories are navigable by their respective tool chains and therefore can be ignored by tools such as `rg`
  Pathname(ignore_file).write(<<~GLOB)
    rbi/*
    sig/*
  GLOB

  sh(*%w[gem build -- anthropic.gemspec])
  rm_rf(ignore_file)
end

desc("Release ruby gem")
multitask(release: [:"build:gem"]) do
  sh(*%w[gem push], *FileList["*.gem"])
end
