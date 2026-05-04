# frozen_string_literal: true

module Anthropic
  @warned_explicit_shadow = false
  @warned_env_shadow = false

  class << self
    def warn_explicit_static_shadows_credentials(param)
      return if @warned_explicit_shadow
      @warned_explicit_shadow = true

      warn(
        "[anthropic-ruby] `#{param}:` was passed alongside `credentials:`; the static credential " \
        "takes precedence and the credentials provider is silently disabled. " \
        "Pass only one."
      )
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
      "claude-opus-4-1-20250805": 8192,
      "anthropic.claude-opus-4-1-20250805-v1:0": 8192,
      "claude-opus-4-1@20250805": 8192
    }.freeze

    # @return [String, nil]
    attr_reader :api_key

    # @return [String, nil]
    attr_reader :auth_token

    # @return [Object, nil]
    attr_reader :credentials

    # @return [Anthropic::Credentials::TokenCache, nil]
    attr_reader :token_cache

    # @return [Anthropic::Resources::Completions]
    attr_reader :completions

    # @return [Anthropic::Resources::Messages]
    attr_reader :messages

    # @return [Anthropic::Resources::Models]
    attr_reader :models

    # @return [Anthropic::Resources::Beta]
    attr_reader :beta

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      headers = {}

      if @api_key
        headers["x-api-key"] = @api_key
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

    # Creates and returns a new client for interacting with the API.
    #
    # Credential precedence, matching the credential-resolution spec and
    # the Workload Identity Federation user guide:
    #
    # 1. Explicit constructor arguments — +api_key:+, +auth_token:+,
    #    +credentials:+, +config:+. If the caller passed any of these,
    #    the SDK uses it and does *not* read credential env vars.
    # 2. +ANTHROPIC_API_KEY+ / +ANTHROPIC_AUTH_TOKEN+ env vars. Only
    #    consulted when no explicit credential argument was passed.
    # 3. +ANTHROPIC_PROFILE+ — explicit profile selection.
    # 4. Direct env-var federation (+ANTHROPIC_IDENTITY_TOKEN[_FILE]+ +
    #    +ANTHROPIC_FEDERATION_RULE_ID+ + +ANTHROPIC_ORGANIZATION_ID+).
    # 5. Fallback active profile from disk (+active_config+ pointer or
    #    the literal +default+).
    #
    # A static env credential (step 2) *shadows* steps 3–5, silently
    # disabling profile / federation auto-discovery.
    #
    # Passing an explicit +api_key:+ or +auth_token:+ *argument*
    # alongside an explicit +credentials:+ is supported: the
    # static credential takes precedence at the request-header level and
    # the credentials provider is silently disabled.
    #
    # @param api_key [String, nil] Defaults to +ENV["ANTHROPIC_API_KEY"]+ when
    #   no explicit credential argument is passed.
    #
    # @param auth_token [String, nil] Defaults to +ENV["ANTHROPIC_AUTH_TOKEN"]+ when
    #   no explicit credential argument is passed.
    #
    # @param credentials [#call, nil] Credential provider — any callable returning
    #   +AccessToken.new(token:, expires_at:)+. The provider is wrapped in a
    #   +TokenCache+ for thread-safe caching and proactive refresh (120s advisory /
    #   30s mandatory before expiry). Common providers: +WorkloadIdentity+,
    #   +CredentialsFile+, +StaticToken+, or a custom lambda.
    #
    # @param config [Hash, nil] In-memory configuration hash with the same shape
    #   as +configs/<profile>.json+. Must include an +authentication+ object with
    #   a +type+ field (+oidc_federation+ or +user_oauth+). Mutually exclusive
    #   with +credentials:+. For +user_oauth+, must also include
    #   +authentication.credentials_path+.
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    #   +"https://api.example.com/v2/"+. Defaults to +ENV["ANTHROPIC_BASE_URL"]+,
    #   then to the profile's +base_url+ if present, then to +https://api.anthropic.com+.
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: nil,
      auth_token: nil,
      credentials: nil,
      config: nil,
      base_url: nil,
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      if config && credentials
        raise ArgumentError, "Pass at most one of `credentials:` or `config:`."
      end

      has_explicit_credential = api_key || auth_token || credentials || config

      unless has_explicit_credential
        api_key = ENV["ANTHROPIC_API_KEY"]
        auth_token = ENV["ANTHROPIC_AUTH_TOKEN"]
      end

      @api_key = api_key&.to_s
      @auth_token = auth_token&.to_s
      @credentials = nil
      @token_cache = nil

      base_url_is_explicit = base_url && !base_url.empty?
      base_url ||= ENV["ANTHROPIC_BASE_URL"]

      credential_headers = {}

      if config
        in_memory = Anthropic::Credentials::InMemoryConfig.new(config)
        @credentials = in_memory
        credential_headers = in_memory.extra_headers
        if !base_url_is_explicit && in_memory.resolved_base_url
          base_url = in_memory.resolved_base_url
        end
      else
        @credentials = credentials
      end

      if @credentials.nil? && @api_key.nil? && @auth_token.nil?
        default_base_url = base_url || "https://api.anthropic.com"
        result = Anthropic::Credentials.default_credentials(base_url: default_base_url)
        if result
          @credentials = result.provider
          credential_headers = result.extra_headers
          base_url = result.base_url if !base_url_is_explicit && result.base_url
        end
      end

      warn_explicit_shadow(api_key: api_key, auth_token: auth_token, credentials: credentials || config)
      warn_env_shadow(api_key: api_key, auth_token: auth_token)

      if @credentials
        @token_cache = Anthropic::Credentials::TokenCache.new(@credentials)
      end

      base_url ||= "https://api.anthropic.com"

      if @credentials.respond_to?(:bind_base_url)
        @credentials.bind_base_url(base_url)
      end

      headers = {
        "anthropic-version" => "2023-06-01"
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

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay,
        headers: headers
      )

      @completions = Anthropic::Resources::Completions.new(client: self)
      @messages = Anthropic::Resources::Messages.new(client: self)
      @models = Anthropic::Resources::Models.new(client: self)
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

    private

    def warn_explicit_shadow(api_key:, auth_token:, credentials:)
      return if credentials.nil?

      Anthropic.warn_explicit_static_shadows_credentials("api_key") if api_key
      Anthropic.warn_explicit_static_shadows_credentials("auth_token") if auth_token
    end

    def warn_env_shadow(api_key:, auth_token:)
      return unless Anthropic::Credentials.auto_discoverable_credentials?

      if api_key && ENV["ANTHROPIC_API_KEY"]
        Anthropic.warn_env_static_shadows_auto_discovery("ANTHROPIC_API_KEY")
      end
      return unless auth_token && ENV["ANTHROPIC_AUTH_TOKEN"]
      Anthropic.warn_env_static_shadows_auto_discovery("ANTHROPIC_AUTH_TOKEN")
    end
  end
end
