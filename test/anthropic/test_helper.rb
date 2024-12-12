# frozen_string_literal: true

# Requiring this file from each test file ensures we always do the following, even
# when running a single-file test:
# - Load the whole gem (as one would in production)
# - Define shared testing namespace so that we don't need to indent test files as much
# - Setting up testing dependencies

require_relative "../../lib/anthropic"
require_relative "test_namespaces"

require "minitest"
require "stringio"

class Minitest::Test
  parallelize_me!
end
