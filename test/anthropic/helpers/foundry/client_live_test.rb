# frozen_string_literal: true

require_relative "../../test_helper"

# Live integration tests for the Microsoft Foundry client. Skipped unless
# ANTHROPIC_LIVE=1.
#
# Expects ANTHROPIC_FOUNDRY_API_KEY and ANTHROPIC_FOUNDRY_RESOURCE (or
# ANTHROPIC_FOUNDRY_BASE_URL) in the environment.
#
# Run: ANTHROPIC_LIVE=1 bundle exec ruby -Itest test/anthropic/helpers/foundry/client_live_test.rb
class Anthropic::Test::FoundryClientLiveTest < Minitest::Test
  extend Minitest::Serial

  MODEL = ENV.fetch("ANTHROPIC_LIVE_MODEL", "claude-haiku-4-5")

  def skip_unless_live
    skip("set ANTHROPIC_LIVE=1 to run live integration tests") unless ENV["ANTHROPIC_LIVE"] == "1"
  end

  def make_client
    Anthropic::FoundryClient.new(max_retries: 1)
  end

  def test_live_non_streaming
    skip_unless_live
    message = make_client.messages.create(
      model: MODEL,
      max_tokens: 32,
      messages: [{role: :user, content: "Say hello in one word."}]
    )
    assert_equal(:assistant, message.role)
    refute_empty(message.content)
    assert_kind_of(String, message.content.first.text)
  end

  def test_live_streaming
    skip_unless_live
    stream = make_client.messages.stream(
      model: MODEL,
      max_tokens: 32,
      messages: [{role: :user, content: "Say hello in one word."}]
    )
    events = stream.map(&:type)
    final = stream.accumulated_message

    assert_equal(:message_start, events.first)
    assert_includes(events, :content_block_delta)
    assert_equal(:message_stop, events.last)
    assert_equal(:assistant, final.role)
  end

  def test_live_bad_model_surfaces_typed_error
    skip_unless_live
    assert_raises(Anthropic::Errors::APIStatusError) do
      make_client.messages.create(
        model: "not-a-real-model",
        max_tokens: 16,
        messages: [{role: :user, content: "hi"}]
      )
    end
  end
end
