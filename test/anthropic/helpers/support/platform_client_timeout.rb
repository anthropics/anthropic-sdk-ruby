# frozen_string_literal: true

# The platform clients forward `timeout:` to the first-party client, which has
# to see whether the caller passed one and not only the resulting value.
module Anthropic::Test::PlatformClientTimeout
  # Yields constructor keywords and expects a client whose `messages.create`
  # posts to `uri`.
  def assert_long_request_check_unless_timeout_passed(uri)
    stub_request(:post, uri).to_return_json(status: 200, body: {})
    params = {max_tokens: 128_000, messages: [{content: "hi", role: :user}], model: :m}

    client = yield({})
    refute_predicate(client, :timeout_overridden?)
    assert_equal(600.0, client.timeout)
    [client.messages, client.beta.messages].each do |messages|
      err = assert_raises(ArgumentError) { messages.create(**params) }
      assert_match(/Streaming is required/, err.message)
    end
    assert_not_requested(:post, uri)

    client = yield({timeout: 600.0})
    assert_predicate(client, :timeout_overridden?)
    client.messages.create(**params)
    assert_requested(:post, uri, times: 1) do |req|
      assert_equal("600.0", req.headers["X-Stainless-Timeout"])
    end
  end
end
