# frozen_string_literal: true

# A client whose requests to the Messages API are answered by WebMock and recorded, with what
# the tests of message threads use to build the responses and to name what was sent.
module Anthropic::Test::ServedMessages
  include WebMock::API

  URL = "http://localhost/v1/messages"
  THREADS_BETA = "message-threads-2026-08-12"

  def before_all
    super
    WebMock.enable!
  end

  def after_all
    WebMock.disable!
    super
  end

  def setup
    super
    Thread.current.thread_variable_set(:mock_sleep, [])
    @client = Anthropic::Client.new(base_url: "http://localhost", api_key: "test-key", max_retries: 0)
    @requests = []
  end

  def teardown
    Thread.current.thread_variable_set(:mock_sleep, nil)
    WebMock.reset!
    super
  end

  # Serves the responses in order, drops the connection in place of `:drop`, and records the
  # body, headers and query of each request.
  def serve(*responses, url: URL)
    stub_request(:post, url).to_return do |request|
      body = JSON.parse(request.body, symbolize_names: true)
      @requests << {body: body, headers: request.headers, query: request.uri.query_values}
      response = responses.fetch(@requests.length - 1)
      response == :drop ? raise(Errno::ECONNRESET) : response
    end
  end

  # Forgets the requests and the responses of the case before, in a test of several cases.
  def start_over
    @requests.clear
    WebMock.reset!
  end

  def bodies = @requests.map { _1.fetch(:body) }

  def betas(index) = @requests.fetch(index).fetch(:headers)["Anthropic-Beta"].to_s.split(",").map(&:strip)

  def helper_headers = @requests.map { _1.fetch(:headers)["X-Stainless-Helper"] }

  def user(text) = {role: :user, content: text}

  def user_wire(text) = {role: "user", content: text}

  def continue_from(id) = {type: "continue", previous_message_id: id}

  def reply_body(id, content, stop_reason, container: nil, iterations: nil)
    body = {
      id: id,
      type: "message",
      role: "assistant",
      model: "claude-sonnet-4-5",
      content: content,
      stop_reason: stop_reason,
      usage: {input_tokens: 1, output_tokens: 1}
    }
    body[:container] = container unless container.nil?
    body[:usage][:iterations] = iterations unless iterations.nil?
    body
  end

  # The `usage.iterations` of a reply that `model` wrote after the requested model declined.
  def written_by_fallback(model)
    tokens = {cache_creation: nil, cache_creation_input_tokens: 0, cache_read_input_tokens: 0, input_tokens: 1, output_tokens: 1}
    [
      {**tokens, model: "claude-sonnet-4-5", type: "message"},
      {**tokens, model: model, type: "fallback_message"},
      {**tokens, type: "compaction"}
    ]
  end

  def json(body) = {status: 200, headers: {"Content-Type" => "application/json"}, body: body.to_json}

  def sse(*events)
    body = events.map { "event: #{_1.fetch(:type)}\ndata: #{_1.to_json}\n\n" }.join
    {status: 200, headers: {"Content-Type" => "text/event-stream"}, body: body}
  end
end
