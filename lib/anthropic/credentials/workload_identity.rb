# frozen_string_literal: true

module Anthropic
  module Credentials
    # Raised when the OIDC token exchange (+POST /v1/oauth/token+) fails.
    #
    # This error includes additional diagnostic information from the token
    # endpoint response to help debug federation configuration issues.
    class WorkloadIdentityError < Anthropic::Errors::Error
      # @return [Integer, nil] HTTP status code from the token endpoint, if available
      attr_reader :status_code

      # @return [Hash, String, nil] error body from the token endpoint (redacted for safety)
      attr_reader :body

      # @return [String, nil] request ID from the token endpoint response headers
      attr_reader :request_id

      # @param message [String] error description
      # @param status_code [Integer, nil] HTTP status code
      # @param body [Hash, String, nil] response body (will be included in error details)
      # @param request_id [String, nil] request ID for debugging
      def initialize(message, status_code: nil, body: nil, request_id: nil)
        super(message)
        @status_code = status_code
        @body = body
        @request_id = request_id
      end

      # @return [String] formatted error message including request ID if available
      def to_s
        base = super
        request_id ? "#{base} [request_id=#{request_id}]" : base
      end
    end

    # Exchanges an external OIDC JWT for an Anthropic access token via the
    # RFC 7523 +jwt-bearer+ grant.
    #
    # This is an access token provider: calling it performs a *fresh* token
    # exchange. Wrap in a {TokenCache} (done automatically when passed as
    # +credentials:+ to {Anthropic::Client}) to avoid exchanging on every
    # request.
    class WorkloadIdentity
      # Maximum size in bytes for the identity token JWT. JWTs from real IdPs
      # are <4 KiB; a 16 KiB ceiling catches misconfiguration.
      MAX_ASSERTION_BYTES = 16 * 1024

      # @param identity_token_provider [#call] callable that returns the external
      #   OIDC JWT string (e.g., {IdentityTokenFile} or a Proc/lambda)
      # @param federation_rule_id [String] the federation rule ID configured in
      #   the Anthropic Console
      # @param organization_id [String] the organization's raw UUID string
      # @param service_account_id [String, nil] optional service account ID to
      #   impersonate
      # @param workspace_id [String, nil] Optional +wrkspc_*+ tagged ID, or the
      #   literal +"default"+ to scope the token to the organization's default
      #   workspace. When omitted the server picks the rule's sole enabled
      #   workspace, else the org default if the rule covers it. Required when
      #   the rule enables more than one non-default workspace, or to target a
      #   specific workspace other than the one the server would pick. The
      #   minted token is workspace-scoped: per-request workspace selection
      #   (the +anthropic-workspace-id+ header) is not supported for federation
      #   tokens — switching workspaces requires a new token exchange with a
      #   different +workspace_id+.
      # @param scope [String, nil] optional OAuth scope (informational only for
      #   federation; the server derives the effective scope from the federation rule)
      def initialize(
        identity_token_provider:,
        federation_rule_id:,
        organization_id:,
        service_account_id: nil,
        workspace_id: nil,
        scope: nil # rubocop:disable Lint/UnusedMethodArgument
      )
        @identity_token_provider = identity_token_provider
        @federation_rule_id = federation_rule_id
        @organization_id = organization_id
        @service_account_id = service_account_id
        @workspace_id = workspace_id
        @bound_base_url = nil
      end

      # Sets the API +base_url+ the token exchange POSTs to.
      #
      # Called by {Anthropic::Client} when this object is passed as +credentials:+,
      # so callers don't pass the same URL twice. For standalone use (no client)
      # or tests, call this directly.
      #
      # @param base_url [String] the API base URL (must be HTTPS except for localhost)
      # @return [void]
      # @raise [Anthropic::Errors::ConfigurationError] if the URL is not HTTPS
      def bind_base_url(base_url)
        bound = base_url.to_s.chomp("/")
        Anthropic::Config.require_https!(bound, field: "base_url")
        @bound_base_url = bound
      end

      # Performs the token exchange and returns an access token.
      #
      # Re-invokes the identity token provider on every call — the underlying
      # file or environment variable may have rotated.
      #
      # @param force_refresh [Boolean] ignored; this provider has no cache to bypass
      # @return [AccessToken] the exchanged access token with expiry
      # @raise [WorkloadIdentityError] if the exchange fails
      def call(force_refresh: false) # rubocop:disable Lint/UnusedMethodArgument
        jwt = @identity_token_provider.call

        if jwt.bytesize > MAX_ASSERTION_BYTES
          raise WorkloadIdentityError,
                "Identity token assertion is #{jwt.bytesize} bytes, exceeding #{MAX_ASSERTION_BYTES}-byte limit"
        end

        perform_exchange(jwt)
      end

      private

      # @return [String] the base URL for token exchange
      def base_url
        @bound_base_url || DEFAULT_BASE_URL
      end

      # @param jwt [String] the identity token JWT
      # @return [AccessToken] the exchanged access token
      # @raise [WorkloadIdentityError] on exchange failure
      def perform_exchange(jwt)
        uri = URI("#{base_url}#{TOKEN_ENDPOINT}")

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == "https"
        http.open_timeout = TOKEN_EXCHANGE_TIMEOUT
        http.read_timeout = TOKEN_EXCHANGE_TIMEOUT

        body = {
          "grant_type" => GRANT_TYPE_JWT_BEARER,
          "assertion" => jwt,
          "federation_rule_id" => @federation_rule_id,
          "organization_id" => @organization_id
        }
        body["service_account_id"] = @service_account_id if @service_account_id
        body["workspace_id"] = @workspace_id if @workspace_id

        request = Net::HTTP::Post.new(uri.path)
        request["Content-Type"] = "application/json"
        request["anthropic-beta"] = "#{OAUTH_API_BETA_HEADER},#{FEDERATION_BETA_HEADER}"
        request["User-Agent"] = "anthropic-ruby/#{Anthropic::VERSION}"
        request.body = JSON.generate(body)

        response = http.request(request)
        request_id = response["request-id"]

        unless response.is_a?(Net::HTTPSuccess)
          handle_error_response(response, request_id)
        end

        data = JSON.parse(response.body, symbolize_names: true)
        token, expires_in =
          case data
          in {access_token: String => token, expires_in: Integer | String => expires_in}
            [token, expires_in.to_i]
          in {access_token: String => token}
            [token, 3600]
          else
            raise WorkloadIdentityError,
                  "Token endpoint response missing access_token field"
          end

        AccessToken.new(token: token, expires_at: Time.now.to_i + expires_in)
      rescue JSON::ParserError
        raise WorkloadIdentityError.new(
          "Token endpoint returned non-JSON response",
          body: response&.body&.slice(0, 256)
        )
      end

      # @param response [Net::HTTPResponse] the error response
      # @param request_id [String, nil] the request ID header value
      # @raise [WorkloadIdentityError] always raises
      def handle_error_response(response, request_id)
        body = begin
          data = JSON.parse(response.body, symbolize_names: true)
          data.slice(:error, :error_description, :error_uri)
        rescue JSON::ParserError
          response.body&.slice(0, 256)
        end

        message = "Token exchange failed (HTTP #{response.code}): #{body}"
        # An ambiguous 401 is usually a federation-rule misconfiguration.
        # Surface the fix in the error rather than making the user dig through docs.
        if response.code.to_i == 401
          hint_parts = ["Ensure your federation rule matches your identity token"]
          if @workspace_id.nil?
            hint_parts << "If your federation rule is scoped to multiple workspaces, set the " \
                          "ANTHROPIC_WORKSPACE_ID environment variable, the 'workspace_id' " \
                          "config key, or the workspace_id: keyword argument"
          end
          hint_parts << "View your authentication events in the Workload identity page of " \
                        "Claude Console for more details"
          message += " #{hint_parts.join('. ')}."
        end

        raise WorkloadIdentityError.new(
          message,
          status_code: response.code.to_i,
          body: body,
          request_id: request_id
        )
      end
    end
  end
end
