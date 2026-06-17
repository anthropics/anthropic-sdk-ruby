# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::BedrockEventStreamTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  FIXTURE = File.join(__dir__, "fixtures", "invoke_with_response_stream.bin")

  def before_all
    super
    WebMock.enable!
  end

  def after_all
    WebMock.disable!
    super
  end

  def teardown
    WebMock.reset!
    super
  end

  def test_to_sse_decodes_aws_event_stream_frames
    raw = File.binread(FIXTURE)
    sse = Anthropic::Helpers::Bedrock::EventStream.to_sse([raw]).to_a.join

    events = Anthropic::Internal::Util.decode_sse(sse.each_line).to_a
    types = events.map { JSON.parse(_1.fetch(:data), symbolize_names: true).fetch(:type) }

    assert_includes(types, "message_start")
    assert_includes(types, "content_block_delta")
    assert_includes(types, "message_stop")
  end

  def test_to_sse_is_incremental
    # Feeding the fixture as many small chunks must yield the same events as
    # feeding it whole — the decoder buffers across chunk boundaries.
    raw = File.binread(FIXTURE)
    chunks = raw.chars.each_slice(97).map(&:join)

    whole = Anthropic::Helpers::Bedrock::EventStream.to_sse([raw]).to_a.join
    parts = Anthropic::Helpers::Bedrock::EventStream.to_sse(chunks).to_a.join

    assert_equal(whole, parts)
  end

  def test_stream_yields_events_and_accumulates_message
    raw = File.binread(FIXTURE)
    stub_request(
      :post,
      %r{bedrock-runtime\.us-east-1\.amazonaws\.com/model/.+/invoke-with-response-stream}
    ).to_return(
      status: 200,
      headers: {"content-type" => "application/vnd.amazon.eventstream"},
      body: raw
    )

    client = Anthropic::BedrockClient.new(aws_region: "us-east-1", api_key: "test-api-key")
    stream = client.messages.stream(
      model: "claude-haiku-4-5-20251001",
      max_tokens: 8,
      messages: [{role: "user", content: "hi"}]
    )

    types = stream.map(&:type)
    assert_includes(types, :message_start)
    assert_includes(types, :message_stop)

    message = stream.accumulated_message
    assert_pattern do
      message => {stop_reason: :end_turn | :max_tokens, content: [{type: :text, text: String}, *]}
    end
  end
end
