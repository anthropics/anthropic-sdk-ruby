# frozen_string_literal: true

require_relative "../../test_helper"
require "googleauth"

class Anthropic::Test::GoogleCloudClientTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  i_suck_and_my_tests_are_order_dependent!

  ENV_KEYS = %w[
    ANTHROPIC_GOOGLE_CLOUD_PROJECT
    ANTHROPIC_GOOGLE_CLOUD_LOCATION
    ANTHROPIC_GOOGLE_CLOUD_WORKSPACE_ID
    ANTHROPIC_GOOGLE_CLOUD_BASE_URL
    GOOGLE_CLOUD_PROJECT
    ANTHROPIC_API_KEY
    ANTHROPIC_AUTH_TOKEN
    ANTHROPIC_BASE_URL
  ].freeze

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
    @saved_env = ENV_KEYS.to_h { [_1, ENV.delete(_1)] }
  end

  def teardown
    WebMock.reset!
    @saved_env.each { |k, v| v.nil? ? ENV.delete(k) : ENV[k] = v }
    super
  end

  # Builds a `googleauth`-shaped credentials stub. `#apply` mirrors
  # `Signet::OAuth2::Client#apply`: it `clone`s (which preserves frozen) then
  # `[]=`s — using `merge` here would mask a FrozenError regression where the
  # deep-frozen middleware headers reach the auth step unthawed.
  def fake_credentials(token: "gcp-token", project_id: nil)
    creds = Object.new
    creds.define_singleton_method(:apply) do |h|
      copy = h.clone
      copy["authorization"] = "Bearer #{token}"
      copy
    end
    creds.define_singleton_method(:project_id) { project_id } unless project_id.nil?
    creds
  end

  def make_client(**kw)
    Anthropic::GoogleCloudClient.new(
      project: "test-proj",
      location: "us-central1",
      workspace_id: "ws-test",
      google_credentials: fake_credentials,
      **kw
    )
  end

  def derived_base_url(location: "us-central1", project: "test-proj", workspace_id: "ws-test")
    "https://claude.googleapis.com/v1alpha" \
      "/projects/#{project}/locations/#{location}/workspaces/#{workspace_id}/invoke"
  end

  # ---------------------------------------------------------------------------
  # Precedence: project
  # ---------------------------------------------------------------------------

  def test_project_arg_beats_env
    ENV["ANTHROPIC_GOOGLE_CLOUD_PROJECT"] = "from-env"
    ENV["GOOGLE_CLOUD_PROJECT"] = "from-gcp-env"
    client = make_client(project: "from-arg")
    assert_equal("from-arg", client.project)
  end

  def test_project_env_beats_gcp_fallback_env
    ENV["ANTHROPIC_GOOGLE_CLOUD_PROJECT"] = "from-env"
    ENV["GOOGLE_CLOUD_PROJECT"] = "from-gcp-env"
    client = Anthropic::GoogleCloudClient.new(
      location: "us-central1", workspace_id: "ws-test", google_credentials: fake_credentials
    )
    assert_equal("from-env", client.project)
  end

  def test_project_gcp_fallback_env
    ENV["GOOGLE_CLOUD_PROJECT"] = "from-gcp-env"
    client = Anthropic::GoogleCloudClient.new(
      location: "us-central1", workspace_id: "ws-test", google_credentials: fake_credentials
    )
    assert_equal("from-gcp-env", client.project)
  end

  def test_project_from_credentials
    client = Anthropic::GoogleCloudClient.new(
      location: "us-central1",
      workspace_id: "ws-test",
      google_credentials: fake_credentials(project_id: "from-creds")
    )
    assert_equal("from-creds", client.project)
  end

  def test_project_env_beats_credentials
    ENV["GOOGLE_CLOUD_PROJECT"] = "from-gcp-env"
    client = Anthropic::GoogleCloudClient.new(
      location: "us-central1",
      workspace_id: "ws-test",
      google_credentials: fake_credentials(project_id: "from-creds")
    )
    assert_equal("from-gcp-env", client.project)
  end

  # ---------------------------------------------------------------------------
  # Precedence: location
  # ---------------------------------------------------------------------------

  def test_location_arg_beats_env
    ENV["ANTHROPIC_GOOGLE_CLOUD_LOCATION"] = "from-env"
    client = make_client(location: "from-arg")
    assert_equal("from-arg", client.location)
  end

  def test_location_from_env
    ENV["ANTHROPIC_GOOGLE_CLOUD_LOCATION"] = "europe-west4"
    client = Anthropic::GoogleCloudClient.new(
      project: "test-proj", workspace_id: "ws-test", google_credentials: fake_credentials
    )
    assert_equal("europe-west4", client.location)
  end

  def test_location_defaults_to_global
    client = Anthropic::GoogleCloudClient.new(
      project: "test-proj", workspace_id: "ws-test", google_credentials: fake_credentials
    )
    assert_equal("global", client.location)
    assert_equal(derived_base_url(location: "global"), client.base_url.to_s)
  end

  def test_explicit_nil_location_falls_back_to_global
    client = Anthropic::GoogleCloudClient.new(
      location: nil, project: "test-proj", workspace_id: "ws-test", google_credentials: fake_credentials
    )
    assert_equal("global", client.location)
    assert_equal(derived_base_url(location: "global"), client.base_url.to_s)
  end

  def test_explicit_nil_location_falls_back_to_env
    ENV["ANTHROPIC_GOOGLE_CLOUD_LOCATION"] = "europe-west4"
    client = Anthropic::GoogleCloudClient.new(
      location: nil, project: "test-proj", workspace_id: "ws-test", google_credentials: fake_credentials
    )
    assert_equal("europe-west4", client.location)
  end

  # ---------------------------------------------------------------------------
  # Precedence: workspace_id
  # ---------------------------------------------------------------------------

  def test_workspace_id_arg_beats_env
    ENV["ANTHROPIC_GOOGLE_CLOUD_WORKSPACE_ID"] = "ws-from-env"
    client = make_client(workspace_id: "ws-from-arg")
    assert_equal("ws-from-arg", client.workspace_id)
  end

  def test_workspace_id_from_env
    ENV["ANTHROPIC_GOOGLE_CLOUD_WORKSPACE_ID"] = "ws-from-env"
    client = Anthropic::GoogleCloudClient.new(
      project: "test-proj", location: "us-central1", google_credentials: fake_credentials
    )
    assert_equal("ws-from-env", client.workspace_id)
  end

  def test_missing_workspace_id_raises
    err = assert_raises(ArgumentError) do
      Anthropic::GoogleCloudClient.new(
        project: "test-proj", location: "us-central1", google_credentials: fake_credentials
      )
    end
    assert_includes(err.message, "workspace_id")
    assert_includes(err.message, "ANTHROPIC_GOOGLE_CLOUD_WORKSPACE_ID")
  end

  # ---------------------------------------------------------------------------
  # Precedence: base_url
  # ---------------------------------------------------------------------------

  def test_base_url_arg_beats_env_and_derivation
    ENV["ANTHROPIC_GOOGLE_CLOUD_BASE_URL"] = "http://from-env.example.com"
    client = make_client(base_url: "http://from-arg.example.com")
    assert_equal("http://from-arg.example.com", client.base_url.to_s)
  end

  def test_base_url_env_beats_derivation
    ENV["ANTHROPIC_GOOGLE_CLOUD_BASE_URL"] = "http://from-env.example.com"
    client = make_client
    assert_equal("http://from-env.example.com", client.base_url.to_s)
  end

  def test_base_url_derived_from_location_and_project
    client = make_client
    assert_equal(derived_base_url, client.base_url.to_s)
  end

  def test_missing_project_raises_when_deriving
    err = assert_raises(ArgumentError) do
      Anthropic::GoogleCloudClient.new(
        location: "us-central1", workspace_id: "ws-test", google_credentials: fake_credentials
      )
    end
    assert_includes(err.message, "project")
    assert_includes(err.message, "ANTHROPIC_GOOGLE_CLOUD_PROJECT")
  end

  def test_explicit_base_url_needs_no_project
    client = Anthropic::GoogleCloudClient.new(
      base_url: "http://localhost", workspace_id: "ws-test", google_credentials: fake_credentials
    )
    assert_equal("http://localhost", client.base_url.to_s)
    assert_nil(client.project)
    assert_equal("global", client.location)
  end

  # ---------------------------------------------------------------------------
  # Credentials
  # ---------------------------------------------------------------------------

  def test_token_provider_wins_over_credentials
    stub_request(:post, "#{derived_base_url}/v1/messages").to_return_json(status: 200, body: {})

    client = make_client(token_provider: -> { "tok-from-provider" })
    client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: :m)

    assert_requested(:post, "#{derived_base_url}/v1/messages") do |req|
      assert_equal("Bearer tok-from-provider", req.headers["Authorization"])
    end
  end

  def test_explicit_credentials_used
    stub_request(:post, "#{derived_base_url}/v1/messages").to_return_json(status: 200, body: {})

    client = make_client(google_credentials: fake_credentials(token: "tok-explicit"))
    client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: :m)

    assert_requested(:post, "#{derived_base_url}/v1/messages") do |req|
      assert_equal("Bearer tok-explicit", req.headers["Authorization"])
    end
  end

  def test_adc_resolved_when_no_credentials_given
    stub_request(:post, "#{derived_base_url}/v1/messages").to_return_json(status: 200, body: {})

    adc = fake_credentials(token: "tok-adc")
    captured_scopes = nil
    loader = lambda do |scopes|
      captured_scopes = scopes
      adc
    end
    Google::Auth.stub(:get_application_default, loader) do
      client = Anthropic::GoogleCloudClient.new(
        project: "test-proj", location: "us-central1", workspace_id: "ws-test"
      )
      client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: :m)
    end

    assert_equal([Anthropic::GoogleCloudClient::SCOPE], captured_scopes)
    assert_requested(:post, "#{derived_base_url}/v1/messages") do |req|
      assert_equal("Bearer tok-adc", req.headers["Authorization"])
    end
  end

  def test_adc_backfills_project
    adc = fake_credentials(token: "tok-adc", project_id: "adc-proj")
    Google::Auth.stub(:get_application_default, adc) do
      client = Anthropic::GoogleCloudClient.new(location: "us-central1", workspace_id: "ws-test")
      assert_equal("adc-proj", client.project)
      assert_equal(derived_base_url(project: "adc-proj"), client.base_url.to_s)
    end
  end

  def test_adc_not_consulted_when_token_provider_given
    Google::Auth.stub(:get_application_default, ->(*) { flunk("ADC should not be consulted") }) do
      client = make_client(token_provider: -> { "tok" }, google_credentials: nil)
      assert_kind_of(Anthropic::GoogleCloudClient, client)
    end
  end

  def test_adc_not_consulted_when_credentials_given
    Google::Auth.stub(:get_application_default, ->(*) { flunk("ADC should not be consulted") }) do
      client = make_client
      assert_kind_of(Anthropic::GoogleCloudClient, client)
    end
  end

  # ---------------------------------------------------------------------------
  # Credential isolation
  # ---------------------------------------------------------------------------

  def test_credential_isolation_no_x_api_key_on_wire
    ENV["ANTHROPIC_API_KEY"] = "sk-ant-leaked"
    ENV["ANTHROPIC_AUTH_TOKEN"] = "auth-leaked"
    ENV["ANTHROPIC_BASE_URL"] = "http://wrong-host.example.com"

    stub_request(:post, "#{derived_base_url}/v1/messages").to_return_json(status: 500, body: {})

    client = make_client
    assert_nil(client.api_key)
    assert_nil(client.auth_token)
    assert_equal(derived_base_url, client.base_url.to_s)

    assert_raises(Anthropic::Errors::InternalServerError) do
      client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: :m)
    end

    assert_requested(:any, /./, times: 3) do |req|
      assert_nil(req.headers["X-Api-Key"])
      assert_equal("Bearer gcp-token", req.headers["Authorization"])
    end
  end

  # ---------------------------------------------------------------------------
  # skip_auth
  # ---------------------------------------------------------------------------

  def test_skip_auth_with_explicit_base_url_no_workspace_id_required
    client = Anthropic::GoogleCloudClient.new(skip_auth: true, base_url: "http://localhost")
    assert_kind_of(Anthropic::GoogleCloudClient, client)
    assert_nil(client.workspace_id)
  end

  def test_skip_auth_without_base_url_requires_workspace_id
    err = assert_raises(ArgumentError) do
      Anthropic::GoogleCloudClient.new(skip_auth: true, project: "test-proj")
    end
    assert_includes(err.message, "workspace_id")
    assert_includes(err.message, "ANTHROPIC_GOOGLE_CLOUD_WORKSPACE_ID")
  end

  def test_skip_auth_derives_base_url_with_workspace_id
    client = Anthropic::GoogleCloudClient.new(
      skip_auth: true, project: "test-proj", workspace_id: "ws-test"
    )
    assert_equal(derived_base_url(location: "global"), client.base_url.to_s)
  end

  def test_skip_auth_no_adc_consulted
    Google::Auth.stub(:get_application_default, ->(*) { flunk("ADC should not be consulted") }) do
      client = Anthropic::GoogleCloudClient.new(skip_auth: true, base_url: "http://localhost")
      assert_kind_of(Anthropic::GoogleCloudClient, client)
    end
  end

  def test_skip_auth_mutually_exclusive_with_token_provider
    err = assert_raises(ArgumentError) do
      Anthropic::GoogleCloudClient.new(skip_auth: true, token_provider: -> { "x" }, base_url: "http://localhost")
    end
    assert_includes(err.message, "mutually exclusive")
  end

  def test_skip_auth_mutually_exclusive_with_credentials
    err = assert_raises(ArgumentError) do
      Anthropic::GoogleCloudClient.new(skip_auth: true, google_credentials: fake_credentials, base_url: "http://localhost")
    end
    assert_includes(err.message, "mutually exclusive")
  end

  def test_skip_auth_request_has_no_auth_headers
    stub_request(:post, "http://localhost/v1/messages").to_return_json(status: 200, body: {})

    client = Anthropic::GoogleCloudClient.new(skip_auth: true, base_url: "http://localhost")
    client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: :m)

    assert_requested(:post, "http://localhost/v1/messages") do |req|
      assert_nil(req.headers["Authorization"])
      assert_nil(req.headers["X-Api-Key"])
      assert_nil(req.headers["Anthropic-Workspace-Id"])
    end
  end

  # ---------------------------------------------------------------------------
  # Workspace header behavior
  # ---------------------------------------------------------------------------

  def test_workspace_header_absent_on_requests
    url = "#{derived_base_url(workspace_id: 'ws-abc')}/v1/messages"
    stub_request(:post, url).to_return_json(status: 200, body: {})

    client = make_client(workspace_id: "ws-abc")
    client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: :m)

    assert_requested(:post, url) do |req|
      assert_nil(req.headers["Anthropic-Workspace-Id"])
    end
  end

  def test_anthropic_version_header_present
    stub_request(:post, "#{derived_base_url}/v1/messages").to_return_json(status: 200, body: {})

    client = make_client
    client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: :m)

    assert_requested(:post, "#{derived_base_url}/v1/messages") do |req|
      assert_equal("2023-06-01", req.headers["Anthropic-Version"])
    end
  end

  # ---------------------------------------------------------------------------
  # Surface
  # ---------------------------------------------------------------------------

  def test_messages_resource_available
    assert_kind_of(Anthropic::Resources::Messages, make_client.messages)
  end

  def test_models_resource_available
    assert_kind_of(Anthropic::Resources::Models, make_client.models)
  end

  def test_beta_resource_available
    assert_kind_of(Anthropic::Resources::Beta, make_client.beta)
  end

  def test_completions_raises
    err = assert_raises(NotImplementedError) { make_client.completions }
    assert_match(/Completions/, err.message)
  end

  # ---------------------------------------------------------------------------
  # Auth per attempt / cross-origin redirect
  # ---------------------------------------------------------------------------

  def test_auth_applies_per_attempt_with_frozen_headers
    url = "#{derived_base_url}/v1/messages"
    stub_request(:post, url).to_return_json({status: 500, body: {}}, {status: 200, body: {}})

    auth_calls = 0
    creds = Object.new
    creds.define_singleton_method(:apply) do |h|
      auth_calls += 1
      copy = h.clone
      copy["authorization"] = "Bearer tok-#{auth_calls}"
      copy
    end

    Thread.current.thread_variable_set(:mock_sleep, [])
    probe = ->(req, nxt) { nxt.call(req) }
    client = make_client(google_credentials: creds, max_retries: 1, middleware: [probe])
    client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: :m)

    assert_equal(2, auth_calls)
    assert_requested(:post, url, times: 2)
  ensure
    Thread.current.thread_variable_set(:mock_sleep, nil)
  end

  def test_cross_origin_redirect_does_not_reapply_auth
    src = "#{derived_base_url}/v1/messages"
    target = "https://other.example.com/redirected"
    stub_request(:post, src).to_return(status: 307, headers: {"location" => target})
    stub_request(:post, target).to_return_json(status: 200, body: {})

    client = make_client(max_retries: 0)
    client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: :m)

    assert_requested(:post, src) do |req|
      assert_equal("Bearer gcp-token", req.headers["Authorization"])
    end
    assert_requested(:post, target) do |req|
      assert_nil(req.headers["Authorization"])
    end
  end

  def test_user_authorization_header_wins
    stub_request(:post, "#{derived_base_url}/v1/messages").to_return_json(status: 200, body: {})

    client = make_client
    client.messages.create(
      max_tokens: 1,
      messages: [{content: "hi", role: :user}],
      model: :m,
      request_options: {extra_headers: {"authorization" => "Bearer user-supplied"}}
    )

    assert_requested(:post, "#{derived_base_url}/v1/messages") do |req|
      assert_equal("Bearer user-supplied", req.headers["Authorization"])
    end
  end
end
