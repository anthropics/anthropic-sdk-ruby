# frozen_string_literal: true

require "yaml"

target(:lib) do
  configure_code_diagnostics(Steep::Diagnostic::Ruby.strict)

  # `rake typecheck:steep` sets this variable to a folder that holds all of `sig` joined into one file
  signature(ENV.fetch("STEEP_SIGNATURE_DIR", "sig"))

  YAML.safe_load_file("./manifest.yaml", symbolize_names: true) => {dependencies:}
  # currently these libraries lack the `*.rbs` annotations required by `steep`
  stdlibs = dependencies - %w[English etc net/http rbconfig set stringio]

  stdlibs.each { library(_1) }
end
