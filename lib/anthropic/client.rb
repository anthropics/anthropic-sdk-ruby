# frozen_string_literal: true

module Anthropic
  @warned_env_shadow = false
  @warned_env_api_key_and_auth_token = false

  class << self
    # @api private
    def warn_env_api_key_and_auth_token
      return if @warned_env_api_key_and_auth_token
      @warned_env_api_key_and_auth_token = true

      warn("Anthropic: ANTHROPIC_API_KEY and ANTHROPIC_AUTH_TOKEN are both set. Using ANTHROPIC_API_KEY.")
    end

    def warn_env_static_shadows_auto_discovery(env_var)
      return if @warned_env_shadow
      @warned_env_shadow = true

      warn(
        "[anthropic-ruby] #{env_var} is set and takes precedence over the SDK's profile / federation " \
        "auto-discovery; unset #{env_var} to use the auto-discovered credential."
      )
    end
  end

  class Client < Anthropic::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 600.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # Models that have specific non-streaming token limits
    MODEL_NONSTREAMING_TOKENS = {
      "claude-opus-4-20250514": 8_192,
      "claude-opus-4-0": 8_192,
      "claude-4-opus-20250514": 8_192,
      "anthropic.claude-opus-4-20250514-v1:0": 8_192,
      "claude-opus-4@20250514": 8_192,
      "anthropic.claude-opus-4-1-20250805-v1:0": 8192,
      "claude-opus-4-1@20250805": 8192
    }.freeze

    # @return [String, nil]
    attr_reader :api_key

    # @return [String, nil]
    attr_reader :auth_token

    # @return [String, nil]
    attr_reader :webhook_key

    # @return [Object, nil]
    attr_reader :credentials

    # @return [Anthropic::Credentials::TokenCache, nil]
    attr_reader :token_cache

    # @return [Anthropic::Resources::Messages]
    attr_reader :messages

    # @return [Anthropic::Resources::Models]
    attr_reader :models

    # @return [Anthropic::Resources::Files]
    attr_reader :files

    # @return [Anthropic::Resources::Skills]
    attr_reader :skills

    # @return [Anthropic::Resources::UserProfiles]
    attr_reader :user_profiles

    # @return [Anthropic::Resources::Organization]
    attr_reader :organization

    # @return [Anthropic::Resources::Beta]
    attr_reader :beta

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      headers = {}

      if @api_key
        headers["authorization"] = "Bearer #{@api_key}" unless @api_key.empty?
      elsif @auth_token
        headers["authorization"] = "Bearer #{@auth_token}"
      elsif @token_cache
        token = @token_cache.get_token
        headers["authorization"] = "Bearer #{token}"
        headers["anthropic-beta"] = Anthropic::Credentials::OAUTH_API_BETA_HEADER
      end

      headers
    end

    # Calculate the timeout for non-streaming requests based on token count
    #
    # @param max_tokens [Integer] The maximum number of tokens to generate
    # @param max_nonstreaming_tokens [Integer, nil] The maximum tokens allowed for non-streaming
    # @return [Float] The calculated timeout in seconds
    # @raise [ArgumentError] If expected time exceeds default time or max_tokens exceeds max_nonstreaming_tokens
    def calculate_nonstreaming_timeout(max_tokens, max_nonstreaming_tokens = nil)
      maximum_time = 60 * 60 # 1 hour in seconds
      default_time = 60 * 10 # 10 minutes in seconds

      expected_time = maximum_time * max_tokens / 128_000.0
      if expected_time > default_time || (max_nonstreaming_tokens && max_tokens > max_nonstreaming_tokens)
        raise ArgumentError.new(
          "Streaming is required for operations that may take longer than 10 minutes. " \
          "See https://github.com/anthropics/anthropic-sdk-ruby#long-requests for more details"
        )
      end

      DEFAULT_TIMEOUT_IN_SECONDS
    end

    # @api private
    #
    # @return [Boolean]
    def timeout_overridden? = @timeout_overridden

    # Creates and returns a new client for interacting with the API.
    #
    # Credential precedence, matching the credential-resolution spec and
    # the Workload Identity Federation user guide:
    #
    # 1. An explicit constructor argument — one of +api_key:+,
    #    +auth_token:+, +credentials:+, +config:+. The SDK uses it and
    #    does *not* fall back to credential env vars or profiles on disk.
    #    Passing more than one raises +ArgumentError+.
    # 2. +ANTHROPIC_API_KEY+, then +ANTHROPIC_AUTH_TOKEN+. Only
    #    consulted when no explicit credential argument was passed. An
    #    empty variable counts as unset. When both are set, the SDK warns
    #    once per process.
    # 3. +ANTHROPIC_PROFILE+ — explicit profile selection.
    # 4. Direct env-var federation (+ANTHROPIC_IDENTITY_TOKEN[_FILE]+ +
    #    +ANTHROPIC_FEDERATION_RULE_ID+ + +ANTHROPIC_ORGANIZATION_ID+).
    # 5. Fallback active profile from disk (+active_config+ pointer or
    #    the literal +default+).
    #
    # A static env credential (step 2) *shadows* steps 3–5, silently
    # disabling profile / federation auto-discovery.
    #
    # @param api_key [String, nil] Defaults to +ENV["ANTHROPIC_API_KEY"]+ when
    #   no explicit credential argument is passed.
    #
    # @param auth_token [String, nil] Defaults to +ENV["ANTHROPIC_AUTH_TOKEN"]+ when
    #   no explicit credential argument is passed and +ANTHROPIC_API_KEY+ is not set.
    #
    # @param credentials [#call, nil] Credential provider — any callable returning
    #   +AccessToken.new(token:, expires_at:)+. The provider is wrapped in a
    #   +TokenCache+ for thread-safe caching and proactive refresh (120s advisory /
    #   30s mandatory before expiry). Common providers: +WorkloadIdentity+,
    #   +CredentialsFile+, +StaticToken+, or a custom lambda.
    #
    # @param config [Hash, nil] In-memory configuration hash with the same shape
    #   as +configs/<profile>.json+. Must include an +authentication+ object with
    #   a +type+ field (+oidc_federation+ or +user_oauth+). For +user_oauth+,
    #   must also include +authentication.credentials_path+.
    #
    # @param webhook_key [String, nil] Defaults to `ENV["ANTHROPIC_WEBHOOK_SIGNING_KEY"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    #   +"https://api.example.com/v2/"+. Defaults to +ENV["ANTHROPIC_BASE_URL"]+,
    #   then to the profile's +base_url+ if present, then to +https://api.anthropic.com+.
    #
    # @param proxy [String, URI::Generic, nil] HTTP proxy URL, e.g., `"http://user:pass@proxy.example.com:8080"`. When `nil`,
    # `net/http` reads the `http_proxy`, `https_proxy`, and `no_proxy` environment
    # variables.
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float, nil] Request timeout in seconds. Defaults to
    # `Anthropic::Client::DEFAULT_TIMEOUT_IN_SECONDS` when `nil`.
    #
    # @param open_telemetry [Hash{Symbol=>Object}, Boolean, nil] OpenTelemetry tracing of this client's API calls. Each call emits a span when
    # the application has registered a tracer provider with the OpenTelemetry API.
    # `true` and `false` are short for `{traces: true}` and `{traces: false}`. Keys
    # can be Strings, and an unknown key raises `ArgumentError`. A client that is
    # given no option reads `ENV["ANTHROPIC_OPEN_TELEMETRY"]`, where `false` is
    # `open_telemetry: false`, `ENV["ANTHROPIC_OPEN_TELEMETRY_PROPAGATION"]`, where
    # `false` is `propagation: false`,
    # `ENV["ANTHROPIC_OPEN_TELEMETRY_TRACES_CONTENT_MODE"]` and
    # `ENV["ANTHROPIC_OPEN_TELEMETRY_TRACES_MAX_CONTENT_BYTES"]`. A client that is
    # given the option, even `true` or `{}`, reads none of them.
    #
    #   @option open_telemetry [#tracer] :tracer_provider Used in place of the registered tracer provider.
    #
    #   @option open_telemetry [Boolean] :propagation `false` sends no trace context headers, such as `traceparent`, with this
    #   client's requests, for an application whose HTTP client instrumentation already
    #   sends them, so that a request does not carry them twice. The spans are
    #   unaffected. Defaults to `true`.
    #
    #   @option open_telemetry [Hash{Symbol=>Object}, Boolean] :traces The settings of the spans. `true` and `false` are short for `{enabled: true}`
    #   and `{enabled: false}`. Its keys:
    #
    #   - `:enabled` (Boolean): `false` disables the spans, and the other keys are then
    #     unused. Defaults to `true`.
    #   - `:content_mode` (Symbol, String): `:content` adds the content of requests and
    #     responses to the spans, and `:metadata_only` does not. Defaults to
    #     `:metadata_only`.
    #   - `:max_content_bytes` (Integer): the most bytes of content that one span holds,
    #     1 or more. Content over the bound is cut, and the span then has
    #     `anthropic.content.truncated`. Defaults to 0.75 MB.
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    #
    # @param middleware [Array<#call>, #call, nil] Per-attempt HTTP around-middleware. Each
    #   entry is a `#call(req, nxt) -> Anthropic::APIResponse` callable. See
    #   {Anthropic::Middleware}.
    #
    # @raise [ArgumentError] If more than one of +api_key:+, +auth_token:+,
    #   +credentials:+, +config:+ is passed.
    def initialize(
      api_key: nil,
      auth_token: nil,
      webhook_key: ENV["ANTHROPIC_WEBHOOK_SIGNING_KEY"],
      credentials: nil,
      config: nil,
      base_url: nil,
      proxy: nil,
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: nil,
      open_telemetry: nil,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY,
      middleware: nil
    )
      @timeout_overridden = !timeout.nil?
      timeout ||= self.class::DEFAULT_TIMEOUT_IN_SECONDS

      credential =
        {api_key: api_key, auth_token: auth_token, credentials: credentials, config: config}.compact
      if credential.length > 1
        raise ArgumentError,
              "Pass at most one of `api_key:`, `auth_token:`, `credentials:`, or `config:`. " \
              "Received #{credential.keys.map { "`#{_1}:`" }.join(', ')}."
      end

      credential = env_credential if credential.empty? && resolve_default_credentials?

      @api_key = credential[:api_key]&.to_s
      @auth_token = credential[:auth_token]&.to_s
      @credentials = nil
      @token_cache = nil

      base_url ||= ENV["ANTHROPIC_BASE_URL"] if resolve_default_credentials?
      # `ANTHROPIC_BASE_URL` counts as explicit: it outranks a profile/config `base_url`.
      base_url_is_explicit = base_url && !base_url.empty?

      credential_headers = {}

      result =
        case credential
        in {credentials:}
          Anthropic::Credentials::CredentialResult.new(provider: credentials)
        in {config:}
          in_memory = Anthropic::Credentials::InMemoryConfig.new(config)
          Anthropic::Credentials::CredentialResult.new(
            provider: in_memory,
            extra_headers: in_memory.extra_headers,
            base_url: in_memory.resolved_base_url
          )
        in {} if resolve_default_credentials?
          Anthropic::Credentials.default_credentials(base_url: base_url || "https://api.anthropic.com")
        in {api_key: _} | {auth_token: _} | {}
          nil
        end

      if result
        @credentials = result.provider
        credential_headers = result.extra_headers
        base_url = result.base_url if !base_url_is_explicit && result.base_url
      end

      if @credentials
        @token_cache = Anthropic::Credentials::TokenCache.new(@credentials)
      end

      if resolve_default_credentials?
        base_url ||= "https://api.anthropic.com"
      elsif base_url.to_s.empty?
        raise ArgumentError.new(
          "No base_url was resolved for #{self.class.name}; " \
          "platform clients must supply their own endpoint."
        )
      end

      if @credentials.respond_to?(:bind_base_url)
        @credentials.bind_base_url(base_url)
      end

      headers = {
        "anthropic-version" => "2026-10-21"
      }
      custom_headers_env = ENV["ANTHROPIC_CUSTOM_HEADERS"]
      unless custom_headers_env.nil?
        parsed = {}
        custom_headers_env.split("\n").each do |line|
          colon = line.index(":")
          unless colon.nil?
            parsed[line[0...colon].strip] = line[(colon + 1)..].strip
          end
        end
        headers = parsed.merge(headers)
      end
      headers = headers.merge(credential_headers)
      @webhook_key = webhook_key&.to_s

      super(
        base_url: base_url,
        proxy: proxy,
        timeout: timeout,
        open_telemetry: open_telemetry,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay,
        headers: headers,
        middleware: middleware
      )

      @messages = Anthropic::Resources::Messages.new(client: self)
      @models = Anthropic::Resources::Models.new(client: self)
      @files = Anthropic::Resources::Files.new(client: self)
      @skills = Anthropic::Resources::Skills.new(client: self)
      @user_profiles = Anthropic::Resources::UserProfiles.new(client: self)
      @organization = Anthropic::Resources::Organization.new(client: self)
      @beta = Anthropic::Resources::Beta.new(client: self)
    end

    # @api private
    #
    # @param status [Integer]
    # @param headers [Hash{String=>String}]
    #
    # @return [Boolean]
    def retry_request?(status, headers:)
      if status == 401 && @token_cache
        @token_cache.invalidate
        return true
      end
      super
    end

    # @api private
    #
    # Whether the platform this client talks to has message threads. Platform clients whose
    # platform has none override this.
    #
    # @return [Boolean]
    def message_threads? = true

    private

    # @api private
    #
    # Whether to resolve credentials from the default chain (the static
    # +ANTHROPIC_API_KEY+ / +ANTHROPIC_AUTH_TOKEN+ env vars and the shared
    # config store / federation auto-discovery, precedence steps 2–5 above)
    # when no explicit credential argument is passed. Called from
    # {#initialize}, so overrides must not depend on subclass instance state.
    # Subclasses that bring their own auth scheme override this to +false+ so
    # ambient first-party credentials are never resolved or folded into
    # requests bound for another platform's endpoint. Returning +false+ also
    # withholds the +ANTHROPIC_BASE_URL+ / +https://api.anthropic.com+
    # base-URL fallback, so such a subclass must pass its own +base_url+ or
    # {#initialize} raises +ArgumentError+.
    #
    # @return [Boolean]
    def resolve_default_credentials? = true

    # @api private
    #
    # Precedence step 2 above, with its warnings.
    #
    # @return [Hash{Symbol=>String}] +{api_key: ...}+, +{auth_token: ...}+ or +{}+
    def env_credential
      present =
        {api_key: "ANTHROPIC_API_KEY", auth_token: "ANTHROPIC_AUTH_TOKEN"}.reject { ENV[_2].to_s.empty? }
      Anthropic.warn_env_api_key_and_auth_token if present.length > 1

      option, env_var = present.first
      return {} if option.nil?

      if Anthropic::Credentials.auto_discoverable_credentials?
        Anthropic.warn_env_static_shadows_auto_discovery(env_var)
      end
      {option => ENV[env_var]}
    end
  end
end
