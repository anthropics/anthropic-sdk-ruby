# frozen_string_literal: true

require_relative "../../test_helper"
require "aws-eventstream"

class Anthropic::Test::BedrockEventStreamTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  FIXTURE = File.join(__dir__, "fixtures", "invoke_with_response_stream.bin")

  MESSAGE_START = {
    type: "message_start",
    message: {
      id: "msg_01",
      type: "message",
      role: "assistant",
      model: "claude-haiku-4-5-20251001",
      content: [],
      stop_reason: nil,
      stop_sequence: nil,
      usage: {input_tokens: 1, output_tokens: 1}
    }
  }.freeze

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

  def test_to_sse_skips_chunks_without_type
    raw = [
      chunk(type: "ping"),
      chunk("amazon-bedrock-invocationMetrics": {inputTokenCount: 1}),
      chunk(type: "message_stop")
    ].join

    sse = Anthropic::Helpers::Bedrock::EventStream.to_sse([raw]).to_a.join
    events = Anthropic::Internal::Util.decode_sse(sse.each_line).to_a

    assert_equal(%w[ping message_stop], events.map { _1.fetch(:event) })
  end

  def test_stream_raises_on_error_frame
    error = frame(
      ":message-type" => "error",
      ":error-code" => "InternalFailure",
      ":error-message" => "Something went wrong."
    )

    types, err = stream_until_error(chunk(MESSAGE_START) + error)

    assert_equal([:message_start], types)
    assert_equal(:InternalFailure, err.type)
    assert_includes(err.message, "Something went wrong.")
  end

  def test_stream_raises_on_exception_frame
    exception = frame(
      {":message-type" => "exception", ":exception-type" => "throttlingException"},
      JSON.generate(message: "Too many requests, please wait before trying again.")
    )

    types, err = stream_until_error(chunk(MESSAGE_START) + exception)

    assert_equal([:message_start], types)
    assert_equal(:throttlingException, err.type)
    assert_includes(err.message, "Too many requests, please wait before trying again.")
  end

  private

  def frame(headers, payload = "")
    Aws::EventStream::Encoder.new.encode(
      Aws::EventStream::Message.new(
        headers: headers.transform_values { Aws::EventStream::HeaderValue.new(value: _1, type: "string") },
        payload: StringIO.new(payload)
      )
    )
  end

  def chunk(event)
    frame(
      {":message-type" => "event", ":event-type" => "chunk"},
      JSON.generate(bytes: Base64.strict_encode64(JSON.generate(event)))
    )
  end

  def stream_until_error(raw)
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

    types = []
    err = assert_raises(Anthropic::Errors::APIStatusError) do
      stream.each { types << _1.type }
    end
    [types, err]
  end
end
