# frozen_string_literal: true

require_relative "../../test_helper"
require_relative "../support/platform_client_env"
require_relative "../support/platform_client_timeout"

class Anthropic::Test::FoundryClientTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API
  include Anthropic::Test::PlatformClientEnv
  include Anthropic::Test::PlatformClientTimeout

  PLATFORM_ENV_KEYS = %w[
    ANTHROPIC_FOUNDRY_API_KEY
    ANTHROPIC_FOUNDRY_RESOURCE
    ANTHROPIC_FOUNDRY_BASE_URL
  ].freeze

  BASE_URL = "https://test-resource.services.ai.azure.com/anthropic/"
  MESSAGES_URL = "#{BASE_URL}v1/messages".freeze

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
  end

  def teardown
    Thread.current.thread_variable_set(:mock_sleep, nil)
    WebMock.reset!
    super
  end

  def make_client(**kw)
    Anthropic::FoundryClient.new(resource: "test-resource", api_key: "foundry-key", **kw)
  end

  def make_token_client(provider = -> { "entra-token" }, **kw)
    Anthropic::FoundryClient.new(resource: "test-resource", azure_ad_token_provider: provider, **kw)
  end

  def create_message(client, **kw)
    client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: :m, **kw)
  end

  def test_base_url_derived_from_resource
    client = make_client
    assert_equal("test-resource", client.resource)
    assert_equal(BASE_URL, client.base_url.to_s)
  end

  def test_resource_arg_beats_env
    ENV["ANTHROPIC_FOUNDRY_RESOURCE"] = "from-env"
    assert_equal("test-resource", make_client.resource)
  end

  def test_resource_from_env
    ENV["ANTHROPIC_FOUNDRY_RESOURCE"] = "from-env"
    client = Anthropic::FoundryClient.new(api_key: "foundry-key")
    assert_equal("from-env", client.resource)
    assert_equal("https://from-env.services.ai.azure.com/anthropic/", client.base_url.to_s)
  end

  def test_explicit_nil_resource_falls_back_to_env
    ENV["ANTHROPIC_FOUNDRY_RESOURCE"] = "from-env"
    assert_equal("from-env", make_client(resource: nil).resource)
  end

  def test_base_url_arg_beats_env
    ENV["ANTHROPIC_FOUNDRY_BASE_URL"] = "http://from-env.example.com"
    client = Anthropic::FoundryClient.new(api_key: "foundry-key", base_url: "http://from-arg.example.com")
    assert_equal("http://from-arg.example.com", client.base_url.to_s)
    assert_nil(client.resource)
  end

  def test_base_url_from_env
    ENV["ANTHROPIC_FOUNDRY_BASE_URL"] = "http://from-env.example.com"
    client = Anthropic::FoundryClient.new(api_key: "foundry-key")
    assert_equal("http://from-env.example.com", client.base_url.to_s)
  end

  def test_empty_env_is_unset
    ENV["ANTHROPIC_FOUNDRY_BASE_URL"] = ""
    assert_equal(BASE_URL, make_client.base_url.to_s)
  end

  def test_base_url_and_resource_mutually_exclusive
    err = assert_raises(ArgumentError) { make_client(base_url: "http://localhost") }
    assert_includes(err.message, "mutually exclusive")
  end

  def test_base_url_env_and_resource_mutually_exclusive
    ENV["ANTHROPIC_FOUNDRY_BASE_URL"] = "http://from-env.example.com"
    err = assert_raises(ArgumentError) { make_client }
    assert_includes(err.message, "mutually exclusive")
  end

  def test_resource_must_be_a_single_dns_label
    [
      "evil.example.com/#",
      "https://test-resource.services.ai.azure.com",
      "test-resource.services.ai.azure.com",
      "test resource",
      "-test",
      "test\n",
      ".",
      "..",
      "a/b",
      "a/../b",
      "a%2Fb"
    ].each do |resource|
      err = assert_raises(ArgumentError) { make_client(resource: resource) }
      assert_includes(err.message, "base_url")
    end
  end

  def test_blank_resource_is_unset
    ["", " "].each do |resource|
      err = assert_raises(ArgumentError) { make_client(resource: resource) }
      assert_includes(err.message, "No endpoint was given")
    end
  end

  def test_missing_endpoint_raises
    ENV["ANTHROPIC_BASE_URL"] = "http://wrong-host.example.com"
    err = assert_raises(ArgumentError) { Anthropic::FoundryClient.new(api_key: "foundry-key") }
    assert_includes(err.message, "ANTHROPIC_FOUNDRY_RESOURCE")
    assert_includes(err.message, "ANTHROPIC_FOUNDRY_BASE_URL")
  end

  def test_missing_credentials_raises
    ENV["ANTHROPIC_API_KEY"] = "sk-ant-leaked"
    err = assert_raises(ArgumentError) { Anthropic::FoundryClient.new(resource: "test-resource") }
    assert_includes(err.message, "ANTHROPIC_FOUNDRY_API_KEY")
  end

  def test_api_key_and_token_provider_mutually_exclusive
    err = assert_raises(ArgumentError) { make_client(azure_ad_token_provider: -> { "entra-token" }) }
    assert_includes(err.message, "mutually exclusive")
  end

  def test_blank_api_key_is_unset
    err = assert_raises(ArgumentError) { make_client(api_key: " ") }
    assert_includes(err.message, "Missing credentials")
  end

  def test_api_key_is_sent_as_x_api_key
    stub_request(:post, MESSAGES_URL).to_return_json(status: 200, body: {})

    create_message(make_client)

    first_party_version = Anthropic::Client.new(api_key: "k").headers["anthropic-version"]
    assert_requested(:post, MESSAGES_URL, times: 1) do |req|
      headers = req.headers.transform_keys(&:downcase)
      assert_equal("foundry-key", headers["x-api-key"])
      assert_equal(first_party_version, headers["anthropic-version"])
      refute(headers.key?("authorization"))
      assert_equal("m", JSON.parse(req.body).fetch("model"))
    end
  end

  def test_api_key_is_sent_on_every_attempt
    stub_request(:post, MESSAGES_URL).to_return_json({status: 500, body: {}}, {status: 200, body: {}})

    create_message(make_client(max_retries: 1))

    assert_requested(:post, MESSAGES_URL, times: 2) do |req|
      assert_equal({"X-Api-Key" => "foundry-key"}, req.headers.slice("X-Api-Key", "Authorization"))
    end
  end

  def test_api_key_from_env
    ENV["ANTHROPIC_FOUNDRY_API_KEY"] = "key-from-env"
    stub_request(:post, MESSAGES_URL).to_return_json(status: 200, body: {})

    client = Anthropic::FoundryClient.new(resource: "test-resource")
    assert_equal("key-from-env", client.api_key)
    create_message(client)

    assert_requested(:post, MESSAGES_URL, times: 1) do |req|
      assert_equal("key-from-env", req.headers["X-Api-Key"])
    end
  end

  def test_base_url_without_trailing_slash_keeps_path
    url = "https://proxy.example.com/anthropic/v1/messages"
    stub_request(:post, url).to_return_json(status: 200, body: {})

    client = Anthropic::FoundryClient.new(api_key: "foundry-key", base_url: "https://proxy.example.com/anthropic")
    create_message(client)

    assert_requested(:post, url, times: 1) do |req|
      assert_equal("foundry-key", req.headers["X-Api-Key"])
    end
  end

  def test_token_provider_sends_bearer_only
    ENV["ANTHROPIC_FOUNDRY_API_KEY"] = "key-from-env"
    stub_request(:post, MESSAGES_URL).to_return_json(status: 200, body: {})

    client = make_token_client
    assert_nil(client.api_key)
    create_message(client)

    assert_requested(:post, MESSAGES_URL, times: 1) do |req|
      headers = req.headers.transform_keys(&:downcase)
      assert_equal("Bearer entra-token", headers["authorization"])
      refute(headers.key?("x-api-key"))
    end
  end

  def test_token_provider_called_per_attempt
    stub_request(:post, MESSAGES_URL).to_return_json({status: 500, body: {}}, {status: 200, body: {}})

    calls = 0
    provider = -> { "entra-token-#{calls += 1}" }
    seen = []
    probe = lambda do |req, nxt|
      seen << req.headers["authorization"]
      nxt.call(req)
    end
    create_message(make_token_client(provider, max_retries: 1, middleware: [probe]))

    assert_equal(2, calls)
    assert_equal([nil, nil], seen)
    assert_requested(:post, MESSAGES_URL, headers: {"Authorization" => "Bearer entra-token-1"}, times: 1)
    assert_requested(:post, MESSAGES_URL, headers: {"Authorization" => "Bearer entra-token-2"}, times: 1)
  end

  def test_token_provider_applies_to_streaming
    stub_request(:post, MESSAGES_URL).to_return(
      status: 200,
      headers: {"content-type" => "text/event-stream"},
      body: "event: message_stop\ndata: {\"type\":\"message_stop\"}\n\n"
    )

    stream = make_token_client.messages.stream_raw(
      max_tokens: 1,
      messages: [{content: "hi", role: :user}],
      model: :m
    )

    assert_equal([:message_stop], stream.map(&:type))
    assert_requested(:post, MESSAGES_URL, headers: {"Authorization" => "Bearer entra-token"}, times: 1)
  end

  def test_token_is_stripped
    stub_request(:post, MESSAGES_URL).to_return_json(status: 200, body: {})

    create_message(make_token_client(-> { "entra-token\n" }))

    assert_requested(:post, MESSAGES_URL, times: 1) do |req|
      assert_equal("Bearer entra-token", req.headers["Authorization"])
    end
  end

  def test_invalid_token_raises
    [nil, "", " ", 1].each do |token|
      err = assert_raises(Anthropic::Errors::ConfigurationError) do
        create_message(make_token_client(-> { token }))
      end
      assert_includes(err.message, "azure_ad_token_provider")
    end
    assert_not_requested(:any, /./)
  end

  def test_token_provider_error_is_not_retried
    calls = 0
    provider = lambda do
      calls += 1
      raise IOError.new("no token")
    end

    assert_raises(IOError) { create_message(make_token_client(provider)) }
    assert_equal(1, calls)
    assert_not_requested(:any, /./)
  end

  def test_user_authorization_header_wins
    stub_request(:post, MESSAGES_URL).to_return_json(status: 200, body: {})

    client = make_token_client(-> { flunk("provider should not be called") })
    create_message(client, request_options: {extra_headers: {"authorization" => "Bearer user-supplied"}})

    assert_requested(:post, MESSAGES_URL, times: 1) do |req|
      assert_equal("Bearer user-supplied", req.headers["Authorization"])
    end
  end

  def test_middleware_authorization_header_wins
    stub_request(:post, MESSAGES_URL).to_return_json(status: 200, body: {})

    set_auth = lambda do |req, nxt|
      nxt.call(req.with(headers: req.headers.merge("Authorization" => "Bearer from-mw")))
    end
    create_message(make_token_client(-> { flunk("provider should not be called") }, middleware: [set_auth]))

    assert_requested(:post, MESSAGES_URL, times: 1) do |req|
      assert_equal("Bearer from-mw", req.headers["Authorization"])
    end
  end

  def test_cross_origin_redirect_does_not_reapply_token
    target = "https://other.example.com/redirected"
    stub_request(:post, MESSAGES_URL).to_return(status: 307, headers: {"location" => target})
    stub_request(:post, target).to_return_json(status: 200, body: {})

    create_message(make_token_client(max_retries: 0))

    assert_requested(:post, MESSAGES_URL, times: 1) do |req|
      assert_equal("Bearer entra-token", req.headers["Authorization"])
    end
    assert_requested(:post, target, times: 1) do |req|
      assert_nil(req.headers["Authorization"])
    end
  end

  def test_cross_origin_redirect_drops_api_key
    target = "https://other.example.com/redirected"
    stub_request(:post, MESSAGES_URL).to_return(status: 307, headers: {"location" => target})
    stub_request(:post, target).to_return_json({status: 500, body: {}}, {status: 200, body: {}})

    create_message(make_client(max_retries: 1))

    assert_requested(:post, MESSAGES_URL, times: 1) do |req|
      assert_equal("foundry-key", req.headers["X-Api-Key"])
    end
    assert_requested(:post, target, times: 2) do |req|
      assert_nil(req.headers["X-Api-Key"])
    end
  end

  def test_same_origin_redirect_keeps_api_key
    target = "#{BASE_URL}redirected"
    stub_request(:post, MESSAGES_URL).to_return(status: 307, headers: {"location" => target})
    stub_request(:post, target).to_return_json(status: 200, body: {})

    create_message(make_client(max_retries: 0))

    assert_requested(:post, target, times: 1) do |req|
      assert_equal("foundry-key", req.headers["X-Api-Key"])
    end
  end

  def test_first_party_env_does_not_leak
    ENV["ANTHROPIC_API_KEY"] = "sk-ant-leaked"
    ENV["ANTHROPIC_AUTH_TOKEN"] = "auth-leaked"
    ENV["ANTHROPIC_BASE_URL"] = "http://wrong-host.example.com"
    stub_request(:post, MESSAGES_URL).to_return_json(status: 200, body: {})

    [make_client, make_token_client].each do |client|
      assert_nil(client.auth_token)
      assert_nil(client.credentials)
      assert_nil(client.token_cache)
      assert_equal(BASE_URL, client.base_url.to_s)
      create_message(client)
    end

    assert_requested(:post, MESSAGES_URL, times: 2) do |req|
      refute_includes(req.headers.values.join, "leaked")
    end
  end

  def test_does_not_consult_first_party_config_store
    with_fake_config_store do
      stub_request(:post, MESSAGES_URL).to_return_json(status: 200, body: {})

      [make_client, make_token_client].each do |client|
        assert_nil(client.credentials)
        assert_nil(client.token_cache)
        assert_equal(BASE_URL, client.base_url.to_s)
        create_message(client)
      end

      assert_requested(:post, MESSAGES_URL, times: 2) do |req|
        headers = req.headers.transform_keys(&:downcase)
        refute_equal("Bearer fake-store-token", headers["authorization"])
        refute(headers.key?("anthropic-workspace-id"))
        refute(headers.key?("anthropic-beta"))
      end
    end
  end

  def test_long_request_check_applies_unless_timeout_is_passed
    assert_long_request_check_unless_timeout_passed(MESSAGES_URL) { make_client(**_1) }
  end

  def test_supported_resources_available
    client = make_client
    assert_kind_of(Anthropic::Resources::Messages, client.messages)
    assert_kind_of(Anthropic::Resources::Files, client.files)
    assert_kind_of(Anthropic::Resources::Skills, client.skills)
    assert_kind_of(Anthropic::Resources::UserProfiles, client.user_profiles)
    assert_kind_of(Anthropic::Resources::Beta, client.beta)
  end

  def test_user_profile_requests_reach_foundry
    profile = {id: "uprof_test", type: "user_profile"}
    [
      [make_client, {"X-Api-Key" => "foundry-key"}],
      [make_token_client, {"Authorization" => "Bearer entra-token"}]
    ].each do |client, credentials|
      [client.user_profiles, client.beta.user_profiles].each do |profiles|
        collection = "#{BASE_URL}v1/user_profiles"
        member = "#{BASE_URL}v1/user_profiles/uprof_test"
        responses = {
          [:post, collection] => profile,
          [:get, collection] => {data: [profile], next_page: nil},
          [:get, member] => profile,
          [:post, member] => profile,
          [:delete, member] => {id: "uprof_test", type: "user_profile_deleted"}
        }
        responses.each do |(method, uri), body|
          stub_request(method, uri).to_return_json(status: 200, body: body)
        end

        assert_equal("uprof_test", profiles.create.id)
        assert_equal(["uprof_test"], profiles.list.data.map(&:id))
        assert_equal("uprof_test", profiles.retrieve("uprof_test").id)
        assert_equal("uprof_test", profiles.update("uprof_test", name: "Name").id)
        assert_equal("uprof_test", profiles.delete("uprof_test").id)

        responses.each_key do |method, uri|
          assert_requested(method, uri, times: 1) do |req|
            assert_equal(credentials, req.headers.slice("X-Api-Key", "Authorization"))
          end
        end
        WebMock.reset!
      end
    end
  end

  def test_messages_send_the_user_profile_id_header
    params = {messages: [{content: "hi", role: :user}], model: :m, user_profile_id: "uprof_test"}
    [make_client, make_token_client].each do |client|
      [
        [MESSAGES_URL, -> { client.messages.create(max_tokens: 1, **params) }],
        [MESSAGES_URL, -> { client.beta.messages.create(max_tokens: 1, **params) }],
        ["#{MESSAGES_URL}/count_tokens", -> { client.messages.count_tokens(**params) }],
        ["#{MESSAGES_URL}/count_tokens", -> { client.beta.messages.count_tokens(**params) }]
      ].each do |uri, call|
        stub_request(:post, uri).to_return_json(status: 200, body: {})
        call.call
        assert_requested(:post, uri, times: 1) do |req|
          assert_equal("uprof_test", req.headers["Anthropic-User-Profile-Id"])
          refute_includes(JSON.parse(req.body).keys, "user_profile_id")
        end
        WebMock.reset!
      end
    end
  end

  def path_param_calls(client)
    [
      client.files.method(:retrieve_metadata),
      client.beta.files.method(:retrieve_metadata),
      client.skills.method(:retrieve),
      client.user_profiles.method(:retrieve),
      client.beta.user_profiles.method(:retrieve)
    ]
  end

  def test_path_params_are_one_encoded_segment
    stub_request(:get, /./).to_return_json(status: 200, body: {})
    urls = []
    client = make_client(middleware: ->(req, nxt) { nxt.call(req.tap { urls << _1.url.to_s }) })

    {
      "id_01AbCdEf" => "id_01AbCdEf",
      "a@b:c" => "a@b:c",
      "a/../b" => "a%2F..%2Fb",
      "a b?c#d" => "a%20b%3Fc%23d"
    }.each do |id, segment|
      path_param_calls(client).each { _1.call(id) }
      assert_equal(
        %w[files files skills user_profiles user_profiles].map { "#{BASE_URL}v1/#{_1}/#{segment}" },
        urls.shift(5)
      )
    end
  end

  def test_dot_segment_or_empty_path_param_raises_before_sending
    tokens = 0
    client = make_token_client(-> { (tokens += 1).to_s })

    {
      "." => "has the dot segment \".\", which would send it to a different URL",
      ".." => "has the dot segment \"..\", which would send it to a different URL",
      "" => "has an empty path parameter, which would send it to a different URL"
    }.each do |id, problem|
      path_param_calls(client).each do |call|
        err = assert_raises(ArgumentError) { call.call(id) }
        assert_includes(err.message, problem)
      end
    end
    assert_equal(0, tokens)
    assert_not_requested(:any, /./)
  end

  def multipart_calls(client, file)
    [
      -> { client.files.upload(file: file) },
      -> { client.beta.files.upload(file: file) },
      -> { client.skills.create(files: [file]) },
      -> { client.beta.skills.create(files: [file]) }
    ]
  end

  def assert_whole_multipart_body(req, content)
    assert_equal(req.body.bytesize.to_s, req.headers.fetch("Content-Length"))
    refute_includes(req.headers.keys, "Transfer-Encoding")
    boundary = req.headers.fetch("Content-Type")[%r{\Amultipart/form-data; boundary=(\S+)\z}, 1]
    assert(req.body.b.start_with?("--#{boundary}\r\n"))
    assert(req.body.b.end_with?("\r\n#{content}\r\n--#{boundary}--\r\n".b))
  end

  def test_multipart_requests_send_a_content_length
    stub_request(:post, /./).to_return_json(status: 200, body: {})
    content = "\xFFhello".b
    file = Anthropic::FilePart.new(StringIO.new(content), filename: "h\u00E9llo.bin")

    [make_client, make_token_client].each { |client| multipart_calls(client, file).each(&:call) }

    assert_requested(:post, /./, times: 8) { assert_whole_multipart_body(_1, content) }
  end

  def test_multipart_body_is_sent_whole_on_every_attempt
    stub_request(:post, "#{BASE_URL}v1/files").to_return_json({status: 500, body: {}}, {status: 200, body: {}})

    make_client.files.upload(file: Pathname(__FILE__))

    assert_requested(:post, /./, times: 2) { assert_whole_multipart_body(_1, File.binread(__FILE__)) }
  end

  def test_models_raise
    client = make_client
    [-> { client.models }, -> { client.beta.models }].each do |call|
      err = assert_raises(NotImplementedError, &call)
      assert_match(/Models API/, err.message)
    end
    assert_not_requested(:any, /./)
  end

  def test_batches_raise
    client = make_client
    [-> { client.messages.batches }, -> { client.beta.messages.batches }].each do |call|
      err = assert_raises(NotImplementedError, &call)
      assert_match(/Message Batches API/, err.message)
    end
    assert_not_requested(:any, /./)
  end

  def test_raw_requests_to_unsupported_apis_are_sent
    stub_request(:get, /./).to_return_json(status: 200, body: {})
    client = make_client

    %w[v1/models v1/messages/batches].each do |path|
      client.request(method: :get, path: path)
      assert_requested(:get, "#{BASE_URL}#{path}", times: 1) do |req|
        assert_equal("foundry-key", req.headers.fetch("X-Api-Key"))
      end
    end
  end
end
