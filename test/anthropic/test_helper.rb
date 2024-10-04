# frozen_string_literal: true

# Requiring this file from each test file ensures we always do the following, even
# when running a single-file test:
# - Load the whole gem (as one would in production)
# - Enable the testing framework
# - Define shared testing namespace so that we don't need to indent test files as much

require "anthropic"

require "test/unit"
require "stringio"

module Anthropic
  module Test
    module Resources
    end
  end
end
