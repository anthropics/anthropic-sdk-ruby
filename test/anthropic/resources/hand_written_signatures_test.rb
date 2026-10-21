# frozen_string_literal: true

require_relative "../test_helper"

# `#tool_runner` takes one hash at runtime, so neither Steep nor Sorbet notices when its
# hand-written signature stops matching the generated one.
class Anthropic::Test::Resources::HandWrittenSignaturesTest < Minitest::Test
  ROOT = File.expand_path("../../..", __dir__)

  # tripwire: remove the parameter from #tool_runner's signature too
  def test_tool_runner_rbi_has_no_request_param_that_create_lacks
    source = File.read("#{ROOT}/rbi/anthropic/resources/beta/messages.rbi")
    assert_empty(rbi_keywords(source, "tool_runner") - rbi_keywords(source, "create") - ["max_iterations"])
  end

  # tripwire: copy the change in the type of #create's `messages` to the runner's doc comments
  def test_runner_yard_message_types_match_create
    path = "lib/anthropic/helpers/tools/runner.rb"
    runner = File.read("#{ROOT}/#{path}")
    create = File.read("#{ROOT}/lib/anthropic/resources/beta/messages.rb")
    expected = yard_params(create, "create").last.to_h.fetch("messages")
    {
      "#feed_messages" => /# @param messages \[(.*)\]\n *def feed_messages\(/,
      "#current_messages" => /# @return \[(.*)\]\n *private def current_messages /
    }.each do |name, pattern|
      assert_equal(expected, capture(runner, pattern).first, "#{path}, #{name}")
    end
  end

  private

  # The `@overload` argument list, then each `@param`'s name and types. Descriptions are left out.
  def yard_params(source, name)
    overload, params = capture(source, /^ *# @overload #{name}\((.*?)\)\n(.*?)^ *# @return/m)
    [overload, params.scan(/@param (\w+) \[(.*?)\](?: |$)/)]
  end

  def rbi_keywords(source, name)
    capture(source, /^ *def #{name}\(\n(.*?)^ *\)\n/m).first.scan(/^ *(\w+):/).flatten
  end

  def capture(source, pattern)
    source.match(pattern)&.captures || flunk("nothing matches #{pattern.inspect}")
  end
end
