# frozen_string_literal: true

require "fileutils"
require "json"
require "tmpdir"

# Env isolation and a fake first-party config store for the platform client
# tests, whose clients must never pick up ambient first-party configuration.
#
# `setup` saves and clears {FIRST_PARTY_ENV_KEYS} plus the including class's
# `PLATFORM_ENV_KEYS`, and `teardown` restores them, so a test may assign
# those `ENV` keys directly.
module Anthropic::Test::PlatformClientEnv
  FIRST_PARTY_ENV_KEYS = %w[
    ANTHROPIC_API_KEY
    ANTHROPIC_AUTH_TOKEN
    ANTHROPIC_BASE_URL
    ANTHROPIC_CONFIG_DIR
    ANTHROPIC_PROFILE
    ANTHROPIC_FEDERATION_RULE_ID
    ANTHROPIC_ORGANIZATION_ID
    ANTHROPIC_IDENTITY_TOKEN
    ANTHROPIC_IDENTITY_TOKEN_FILE
    ANTHROPIC_CUSTOM_HEADERS
    ANTHROPIC_WEBHOOK_SIGNING_KEY
  ].freeze

  # Platform-specific keys to isolate; redefine in the including class.
  PLATFORM_ENV_KEYS = [].freeze

  def setup
    super
    keys = FIRST_PARTY_ENV_KEYS + self.class::PLATFORM_ENV_KEYS
    @saved_env = keys.to_h { [_1, ENV.delete(_1)] }
  end

  def teardown
    @saved_env.each { |k, v| v.nil? ? ENV.delete(k) : ENV[k] = v }
    super
  end

  # Sets `env`, clearing any key mapped to nil, and restores the previous
  # values afterwards.
  def with_env(env)
    original = env.keys.to_h { [_1, ENV.fetch(_1, nil)] }
    env.each { |key, value| value.nil? ? ENV.delete(key) : ENV[key] = value }
    yield
  ensure
    original&.each { |key, value| value.nil? ? ENV.delete(key) : ENV[key] = value }
  end

  # Writes a fake first-party config store in the layout `Anthropic::Credentials`
  # reads (an active `default` user_oauth profile with a workspace id, a
  # base_url, and a live access token) into a temporary directory, points
  # `ANTHROPIC_CONFIG_DIR` at it for the duration of the block, and yields the
  # directory. `setup` has already cleared the static credential env, so
  # auto-discovery finds it — checked up front with a first-party client as a
  # control, so a platform client that ignores the store ignores a live one.
  def with_fake_config_store
    Dir.mktmpdir do |dir|
      FileUtils.mkdir_p(File.join(dir, "configs"))
      FileUtils.mkdir_p(File.join(dir, "credentials"))
      File.write(
        File.join(dir, "configs", "default.json"),
        JSON.generate(
          {
            authentication: {type: "user_oauth"},
            workspace_id: "wrkspc_fake_store_value",
            base_url: "https://store.example.com"
          }
        )
      )
      credentials_path = File.join(dir, "credentials", "default.json")
      File.write(
        credentials_path,
        JSON.generate({access_token: "fake-store-token", expires_at: Time.now.to_i + 3600})
      )
      File.chmod(0o600, credentials_path)

      with_env("ANTHROPIC_CONFIG_DIR" => dir) do
        control = Anthropic::Client.new
        assert_kind_of(Anthropic::Credentials::CredentialsFile, control.credentials)
        assert_equal("https://store.example.com", control.base_url.to_s)

        yield(dir)
      end
    end
  end
end
