# frozen_string_literal: true

require_relative "../../test_helper"
require_relative "../support/platform_client_timeout"
require "aws-sdk-core"
require "tmpdir"

class Anthropic::Test::BedrockMantleClientTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API
  include Anthropic::Test::PlatformClientTimeout

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
    @original_anthropic_config_dir = ENV["ANTHROPIC_CONFIG_DIR"]
    @isolated_config_dir = Dir.mktmpdir
    ENV["ANTHROPIC_CONFIG_DIR"] = @isolated_config_dir
  end

  def teardown
    WebMock.reset!
    ENV["ANTHROPIC_CONFIG_DIR"] = @original_anthropic_config_dir
    FileUtils.rm_rf(@isolated_config_dir) if @isolated_config_dir
    super
  end

  # ---------------------------------------------------------------------------
  # Initialization tests
  # ---------------------------------------------------------------------------

  def test_api_key_mode_via_constructor
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_kind_of(Anthropic::BedrockMantleClient, client)
  end

  def test_sigv4_mode_via_explicit_credentials
    client = Anthropic::BedrockMantleClient.new(
      aws_access_key: "AKIAIOSFODNN7EXAMPLE",
      aws_secret_access_key: "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY",
      aws_region: "us-east-1"
    )
    assert_kind_of(Anthropic::BedrockMantleClient, client)
  end

  def test_sigv4_mode_via_aws_profile
    mock_creds = Aws::Credentials.new("fake-access", "fake-secret")
    Aws::SharedCredentials.stub(:new, mock_creds) do
      client = Anthropic::BedrockMantleClient.new(
        aws_profile: "my-profile",
        aws_region: "us-east-1"
      )
      assert_kind_of(Anthropic::BedrockMantleClient, client)
    end
  end

  def test_partial_credentials_raises
    assert_raises(ArgumentError) do
      Anthropic::BedrockMantleClient.new(
        aws_access_key: "AKIA",
        aws_region: "us-east-1"
      )
    end
  end

  # ---------------------------------------------------------------------------
  # Env var fallback tests
  # ---------------------------------------------------------------------------

  def test_api_key_from_mantle_env
    ENV["AWS_BEARER_TOKEN_BEDROCK"] = "mantle-key"
    client = Anthropic::BedrockMantleClient.new(base_url: "http://localhost")
    assert_equal(false, client.instance_variable_get(:@use_sig_v4))
  ensure
    ENV.delete("AWS_BEARER_TOKEN_BEDROCK")
  end

  def test_api_key_falls_back_to_aws_env
    ENV["ANTHROPIC_AWS_API_KEY"] = "aws-fallback-key"
    client = Anthropic::BedrockMantleClient.new(base_url: "http://localhost")
    assert_equal(false, client.instance_variable_get(:@use_sig_v4))
  ensure
    ENV.delete("ANTHROPIC_AWS_API_KEY")
  end

  def test_mantle_api_key_env_overrides_aws_env
    ENV["AWS_BEARER_TOKEN_BEDROCK"] = "mantle-key"
    ENV["ANTHROPIC_AWS_API_KEY"] = "aws-key"
    client = Anthropic::BedrockMantleClient.new(base_url: "http://localhost")
    assert_equal(false, client.instance_variable_get(:@use_sig_v4))
  ensure
    ENV.delete("AWS_BEARER_TOKEN_BEDROCK")
    ENV.delete("ANTHROPIC_AWS_API_KEY")
  end

  # ---------------------------------------------------------------------------
  # Region and base URL tests
  # ---------------------------------------------------------------------------

  def test_base_url_derived_from_region
    client = Anthropic::BedrockMantleClient.new(
      aws_access_key: "AKIA",
      aws_secret_access_key: "secret",
      aws_region: "us-west-2"
    )
    assert_equal("https://bedrock-mantle.us-west-2.api.aws/anthropic", client.base_url.to_s)
  end

  def test_base_url_from_constructor_overrides_derived
    client = Anthropic::BedrockMantleClient.new(
      aws_access_key: "AKIA",
      aws_secret_access_key: "secret",
      aws_region: "us-east-1",
      base_url: "http://localhost:9000"
    )
    assert_equal("http://localhost:9000", client.base_url.to_s)
  end

  def test_base_url_from_env
    ENV["ANTHROPIC_BEDROCK_MANTLE_BASE_URL"] = "http://custom.mantle.example.com"
    client = Anthropic::BedrockMantleClient.new(
      aws_access_key: "AKIA",
      aws_secret_access_key: "secret",
      aws_region: "us-east-1"
    )
    assert_equal("http://custom.mantle.example.com", client.base_url.to_s)
  ensure
    ENV.delete("ANTHROPIC_BEDROCK_MANTLE_BASE_URL")
  end

  def test_missing_region_in_sigv4_mode_raises
    assert_raises(ArgumentError) do
      Anthropic::BedrockMantleClient.new(
        aws_access_key: "AKIA",
        aws_secret_access_key: "secret"
      )
    end
  end

  # ---------------------------------------------------------------------------
  # Request behavior tests
  # ---------------------------------------------------------------------------

  def test_sigv4_request_includes_bedrock_mantle_service_name
    stub_request(:post, "https://bedrock-mantle.us-east-1.api.aws/anthropic/v1/messages").to_return_json(
      status: 500,
      body: {}
    )

    client = Anthropic::BedrockMantleClient.new(
      aws_access_key: "my-aws-access",
      aws_secret_access_key: "my-aws-secret",
      aws_region: "us-east-1"
    )

    assert_raises(Anthropic::Errors::InternalServerError) do
      client.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello", role: :user}],
        model: :"claude-sonnet-4-20250514"
      )
    end

    assert_requested(:any, /./, times: 3) do |req|
      auth = req.headers.fetch("Authorization")
      assert_match(/^AWS4-HMAC-SHA256/, auth)
      assert_match(/bedrock-mantle/, auth)
    end
  end

  def test_long_request_check_applies_unless_timeout_is_passed
    assert_long_request_check_unless_timeout_passed("http://localhost/v1/messages") do |kw|
      Anthropic::BedrockMantleClient.new(skip_auth: true, base_url: "http://localhost", **kw)
    end
  end

  # ---------------------------------------------------------------------------
  # User profile ID tests
  # ---------------------------------------------------------------------------

  def test_create_sends_user_profile_id_in_body_instead_of_header
    each_messages_resource do |messages, url|
      stub_request(:post, url).to_return_json(status: 200, body: {})

      messages.create(**message_params, user_profile_id: "uprof_test")

      assert_requested(:post, url, times: 1) do |req|
        assert_nil(req.headers["Anthropic-User-Profile-Id"])
        assert_equal("uprof_test", JSON.parse(req.body)["user_profile_id"])
        assert_equal("claude-opus-4-6", JSON.parse(req.body)["model"])
      end
    end
  end

  def test_create_without_user_profile_id_leaves_body_untouched
    each_messages_resource do |messages, url|
      stub_request(:post, url).to_return_json(status: 200, body: {})

      messages.create(**message_params)

      assert_requested(:post, url, times: 1) do |req|
        assert_nil(req.headers["Anthropic-User-Profile-Id"])
        refute_includes(JSON.parse(req.body).keys, "user_profile_id")
      end
    end
  end

  def test_create_sends_user_profile_id_from_extra_headers_in_body
    each_messages_resource do |messages, url|
      stub_request(:post, url).to_return_json(status: 200, body: {})

      messages.create(
        **message_params,
        request_options: {extra_headers: {"Anthropic-User-Profile-Id" => "uprof_extra"}}
      )

      assert_requested(:post, url, times: 1) do |req|
        assert_nil(req.headers["Anthropic-User-Profile-Id"])
        assert_equal("uprof_extra", JSON.parse(req.body)["user_profile_id"])
      end
    end
  end

  def test_create_sends_two_user_profile_ids_in_body_as_given
    each_messages_resource do |messages, url|
      stub_request(:post, url).to_return_json(status: 200, body: {})

      messages.create(**message_params, user_profile_id: "uprof_one,uprof_two")

      assert_requested(:post, url, times: 1) do |req|
        assert_nil(req.headers["Anthropic-User-Profile-Id"])
        assert_equal("uprof_one,uprof_two", JSON.parse(req.body)["user_profile_id"])
      end
    end
  end

  def test_create_keeps_user_profile_id_already_in_body
    [:user_profile_id, "user_profile_id"].each do |key|
      each_messages_resource do |messages, url|
        stub_request(:post, url).to_return_json(status: 200, body: {})

        messages.create(
          **message_params,
          user_profile_id: "uprof_header",
          request_options: {extra_body: {key => "uprof_body"}}
        )

        assert_requested(:post, url, times: 1) do |req|
          assert_nil(req.headers["Anthropic-User-Profile-Id"])
          assert_equal(1, req.body.scan('"user_profile_id"').length)
          assert_equal("uprof_body", JSON.parse(req.body)["user_profile_id"])
        end
      end
      WebMock.reset_executed_requests!
    end
  end

  def test_stream_sends_user_profile_id_in_body_instead_of_header
    each_messages_resource do |messages, url|
      stub_request(:post, url).to_return(
        status: 200,
        headers: {"content-type" => "text/event-stream"},
        body: message_sse
      )

      stream = messages.stream(**message_params, user_profile_id: "uprof_test")
      assert_equal("Hello", stream.accumulated_message.content.first.text)

      events = messages.stream_raw(**message_params, user_profile_id: "uprof_test").to_a
      assert_equal(:message_stop, events.last.type)

      assert_requested(:post, url, times: 2) do |req|
        assert_nil(req.headers["Anthropic-User-Profile-Id"])
        assert_equal("uprof_test", JSON.parse(req.body)["user_profile_id"])
        assert_equal(true, JSON.parse(req.body)["stream"])
      end
    end
  end

  def test_count_tokens_sends_user_profile_id_in_body_instead_of_header
    each_messages_resource("/count_tokens") do |messages, url|
      stub_request(:post, url).to_return_json(status: 200, body: {input_tokens: 1})

      messages.count_tokens(**message_params.except(:max_tokens), user_profile_id: "uprof_test")

      assert_requested(:post, url, times: 1) do |req|
        assert_nil(req.headers["Anthropic-User-Profile-Id"])
        assert_equal("uprof_test", JSON.parse(req.body)["user_profile_id"])
      end
    end
  end

  def test_first_party_client_keeps_user_profile_id_header
    url = "https://api.anthropic.com/v1/messages"
    stub_request(:post, url).to_return_json(status: 200, body: {})

    client = Anthropic::Client.new(api_key: "sk-ant-xxx", base_url: "https://api.anthropic.com")
    client.messages.create(**message_params, user_profile_id: "uprof_test")

    assert_requested(:post, url, times: 1) do |req|
      assert_equal("uprof_test", req.headers["Anthropic-User-Profile-Id"])
      refute_includes(JSON.parse(req.body).keys, "user_profile_id")
    end
  end

  def test_batches_still_send_user_profile_id_header
    url = "http://localhost/v1/messages/batches"
    stub_request(:post, url).to_return_json(status: 200, body: {})

    client = Anthropic::BedrockMantleClient.new(skip_auth: true, base_url: "http://localhost")
    client.messages.batches.create(
      requests: [{custom_id: "request-1", params: message_params}],
      user_profile_id: "uprof_test"
    )

    assert_requested(:post, url, times: 1) do |req|
      assert_equal("uprof_test", req.headers["Anthropic-User-Profile-Id"])
      refute_includes(JSON.parse(req.body).keys, "user_profile_id")
    end
  end

  def test_sigv4_signs_body_carrying_user_profile_id_on_each_attempt
    Thread.current.thread_variable_set(:mock_sleep, [])
    url = "https://bedrock-mantle.us-east-1.api.aws/anthropic/v1/messages"
    stub_request(:post, url).to_return_json({status: 500, body: {}}, {status: 200, body: {}})

    client = Anthropic::BedrockMantleClient.new(
      aws_access_key: "my-aws-access",
      aws_secret_access_key: "my-aws-secret",
      aws_region: "us-east-1",
      max_retries: 1
    )
    client.messages.create(**message_params, user_profile_id: "uprof_test")

    assert_requested(:post, url, times: 2) do |req|
      assert_nil(req.headers["Anthropic-User-Profile-Id"])
      assert_equal("uprof_test", JSON.parse(req.body)["user_profile_id"])
      assert_equal(Digest::SHA256.hexdigest(req.body), req.headers["X-Amz-Content-Sha256"])
      refute_match(/anthropic-user-profile-id/, req.headers.fetch("Authorization"))
    end
  ensure
    Thread.current.thread_variable_set(:mock_sleep, nil)
  end

  def test_user_profile_id_header_from_middleware_is_matched_case_insensitively
    url = "http://localhost/v1/messages"
    stub_request(:post, url).to_return_json(status: 200, body: {})
    seen = nil
    add_header = lambda do |req, nxt|
      seen = req
      nxt.call(req.with(headers: {**req.headers, "Anthropic-User-Profile-Id" => "uprof_middleware"}))
    end

    client = Anthropic::BedrockMantleClient.new(skip_auth: true, base_url: "http://localhost")
    client.messages.create(
      **message_params,
      user_profile_id: "uprof_test",
      request_options: {middleware: [add_header]}
    )

    assert_equal("uprof_test", seen.headers["anthropic-user-profile-id"])
    refute_includes(seen.body.keys, :user_profile_id)
    assert_requested(:post, url, times: 1) do |req|
      assert_nil(req.headers["Anthropic-User-Profile-Id"])
      assert_equal("uprof_middleware", JSON.parse(req.body)["user_profile_id"])
    end
  end

  def test_user_profile_id_header_unset_by_middleware_is_not_sent_as_null
    url = "http://localhost/v1/messages"
    stub_request(:post, url).to_return_json(status: 200, body: {})
    unset_header = lambda do |req, nxt|
      nxt.call(req.with(headers: {**req.headers, "anthropic-user-profile-id" => nil}))
    end

    client = Anthropic::BedrockMantleClient.new(skip_auth: true, base_url: "http://localhost")
    client.messages.create(
      **message_params,
      user_profile_id: "uprof_test",
      request_options: {middleware: [unset_header]}
    )

    assert_requested(:post, url, times: 1) do |req|
      assert_nil(req.headers["Anthropic-User-Profile-Id"])
      refute_includes(JSON.parse(req.body).keys, "user_profile_id")
    end
  end

  def test_non_hash_body_leaves_request_unchanged
    url = "http://localhost/v1/messages"
    stub_request(:post, url).to_return_json(status: 200, body: {})
    encoded = JSON.generate(message_params)
    encode_body = ->(req, nxt) { nxt.call(req.with(body: StringIO.new(encoded))) }

    client = Anthropic::BedrockMantleClient.new(skip_auth: true, base_url: "http://localhost")
    client.messages.create(
      **message_params,
      user_profile_id: "uprof_test",
      request_options: {middleware: [encode_body]}
    )

    assert_requested(:post, url, times: 1) do |req|
      assert_equal("uprof_test", req.headers["Anthropic-User-Profile-Id"])
      assert_equal(encoded, req.body)
    end
  end

  # ---------------------------------------------------------------------------
  # skip_auth tests
  # ---------------------------------------------------------------------------

  def test_skip_auth_request_has_no_auth_headers
    stub_request(:post, "http://localhost/v1/messages").to_return_json(
      status: 500,
      body: {}
    )

    client = Anthropic::BedrockMantleClient.new(skip_auth: true, base_url: "http://localhost")

    assert_raises(Anthropic::Errors::InternalServerError) do
      client.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello", role: :user}],
        model: :"claude-sonnet-4-20250514"
      )
    end

    assert_requested(:any, /./, times: 3) do |req|
      assert_nil(req.headers["Authorization"])
      assert_nil(req.headers["X-Api-Key"])
    end
  end

  # ---------------------------------------------------------------------------
  # ANTHROPIC_API_KEY leak prevention
  # ---------------------------------------------------------------------------

  def test_sigv4_does_not_leak_anthropic_api_key
    ENV["ANTHROPIC_API_KEY"] = "should-not-appear"

    stub_request(:post, "https://bedrock-mantle.us-east-1.api.aws/anthropic/v1/messages").to_return_json(
      status: 500,
      body: {}
    )

    client = Anthropic::BedrockMantleClient.new(
      aws_access_key: "my-aws-access",
      aws_secret_access_key: "my-aws-secret",
      aws_region: "us-east-1"
    )

    assert_raises(Anthropic::Errors::InternalServerError) do
      client.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello", role: :user}],
        model: :"claude-sonnet-4-20250514"
      )
    end

    assert_requested(:any, /./, times: 3) do |req|
      assert_nil(req.headers["X-Api-Key"])
      assert_match(/^AWS4-HMAC-SHA256/, req.headers.fetch("Authorization"))
    end
  ensure
    ENV.delete("ANTHROPIC_API_KEY")
  end

  # ---------------------------------------------------------------------------
  # Type restriction tests
  # ---------------------------------------------------------------------------

  def test_messages_resource_available
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_respond_to(client, :messages)
    assert_kind_of(Anthropic::Resources::Messages, client.messages)
  end

  def test_beta_messages_available
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_respond_to(client.beta, :messages)
    assert_kind_of(Anthropic::Resources::Beta::Messages, client.beta.messages)
  end

  def test_completions_raises_not_implemented
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_raises(NotImplementedError) { client.completions }
  end

  def test_models_raises_not_implemented
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_raises(NotImplementedError) { client.models }
  end

  def test_files_raises_not_implemented
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_raises(NotImplementedError) { client.files }
  end

  def test_skills_raises_not_implemented
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_raises(NotImplementedError) { client.skills }
  end

  def test_user_profiles_raises_not_implemented
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_raises(NotImplementedError) { client.user_profiles }
  end

  def test_beta_user_profiles_raises_not_implemented
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_raises(NotImplementedError) { client.beta.user_profiles }
  end

  def test_beta_models_raises_not_implemented
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_raises(NotImplementedError) { client.beta.models }
  end

  def test_beta_files_raises_not_implemented
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_raises(NotImplementedError) { client.beta.files }
  end

  def test_beta_skills_raises_not_implemented
    client = Anthropic::BedrockMantleClient.new(api_key: "sk-ant-xxx", base_url: "http://localhost")
    assert_raises(NotImplementedError) { client.beta.skills }
  end

  # First-party static env keys must never fold into a Mantle client, in any
  # auth mode.
  def test_skip_auth_ignores_first_party_env_keys
    original = %w[ANTHROPIC_API_KEY ANTHROPIC_AUTH_TOKEN].to_h { [_1, ENV.fetch(_1, nil)] }
    begin
      ENV["ANTHROPIC_API_KEY"] = "env-api-key"
      ENV["ANTHROPIC_AUTH_TOKEN"] = "env-auth-token"

      stub_request(:post, "http://localhost/v1/messages").to_return_json({status: 200, body: {}})

      client = Anthropic::BedrockMantleClient.new(skip_auth: true, base_url: "http://localhost")
      assert_nil(client.credentials)
      assert_nil(client.token_cache)
      client.messages.create(max_tokens: 1024, messages: [{content: "hi", role: :user}], model: :m)

      assert_requested(:post, "http://localhost/v1/messages", times: 1) do |req|
        assert_nil(req.headers["Authorization"])
        assert_nil(req.headers["X-Api-Key"])
        true
      end
    ensure
      original.each { |key, value| value.nil? ? ENV.delete(key) : ENV[key] = value }
    end
  end

  private

  def message_params
    {max_tokens: 1024, messages: [{content: "Hello", role: :user}], model: :"claude-opus-4-6"}
  end

  def each_messages_resource(subpath = "")
    client = Anthropic::BedrockMantleClient.new(skip_auth: true, base_url: "http://localhost")
    yield(client.messages, "http://localhost/v1/messages#{subpath}")
    yield(client.beta.messages, "http://localhost/v1/messages#{subpath}?beta=true")
  end

  def message_sse
    <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_test","type":"message","role":"assistant","content":[],"model":"claude-opus-4-6","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":1,"output_tokens":1}}}

      event: content_block_start
      data: {"type":"content_block_start","index":0,"content_block":{"type":"text","text":""}}

      event: content_block_delta
      data: {"type":"content_block_delta","index":0,"delta":{"type":"text_delta","text":"Hello"}}

      event: content_block_stop
      data: {"type":"content_block_stop","index":0}

      event: message_delta
      data: {"type":"message_delta","delta":{"stop_reason":"end_turn","stop_sequence":null},"usage":{"output_tokens":1}}

      event: message_stop
      data: {"type":"message_stop"}

    SSE
  end
end
