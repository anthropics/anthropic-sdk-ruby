# frozen_string_literal: true

# Requiring this file from each test file ensures we always do the following, even
# when running a single-file test:
# - Load the whole gem (as one would in production)
# - Define shared testing namespace so that we don't need to indent test files as much
# - Setting up testing dependencies

require_relative "../../lib/anthropic"
require_relative "test_namespaces"

require "minitest"
require "minitest/focus"
require "minitest/hooks/test"

class Minitest::Test
  parallelize_me!
  make_my_diffs_pretty!

  include Minitest::Hooks
end

class Time
  class << self
    alias_method :_now, :now
  end

  def self.now = Thread.current.thread_variable_get(:time_now) || _now
end

module Kernel
  alias_method :_sleep, :sleep

  def sleep(secs)
    case (counter = Thread.current.thread_variable_get(:mock_sleep))
    in Array
      counter << secs
      secs
    else
      _sleep(secs)
    end
  end
end
