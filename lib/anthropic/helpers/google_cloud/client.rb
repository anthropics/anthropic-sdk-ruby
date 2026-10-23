# frozen_string_literal: true

module Anthropic
  module Helpers
    module GoogleCloud
      # Client for Claude Models on Google Cloud (Anthropic managed) — the
      # first-party Anthropic API served through the Google Cloud gateway.
      #
      # This is distinct from {Anthropic::VertexClient}, which targets the
      # `:rawPredict` publisher-model API (publisher model IDs, messages
      # only). This client speaks the full first-party Anthropic API: requests
      # pass through the gateway unchanged — standard `/v1/*` paths, standard
      # model names. The gateway does not serve the User Profiles API.
      class Client < Anthropic::Client
        # OAuth2 scope required to call the gateway.
        SCOPE = "https://www.googleapis.com/auth/cloud-platform"

        LOCATION_URL_TEMPLATE =
          "https://claude.googleapis.com/v1/projects/%<project>s/locations/%<location>s"

        # Gateway base URL template; override via `base_url` or
        # `ANTHROPIC_GOOGLE_CLOUD_BASE_URL`.
        URL_TEMPLATE = "#{LOCATION_URL_TEMPLATE}/workspaces/%<workspace_id>s/invoke".freeze

        # Gateway base URL template for organization-level routes, which are
        # served from a base with no workspace in it.
        ORGANIZATION_URL_TEMPLATE = "#{LOCATION_URL_TEMPLATE}/claudeOrganization/invoke".freeze

        ORGANIZATION_PATH_PREFIX = "/v1/organizations/"

        private_constant :LOCATION_URL_TEMPLATE, :ORGANIZATION_PATH_PREFIX

        # @return [String, nil]
        attr_reader :project

        # @return [String, nil]
        attr_reader :location

        # @return [String, nil]
        attr_reader :workspace_id

        # Creates a new client for the Anthropic API on the Google Cloud gateway.
        #
        # Authentication uses Google credentials by precedence (unless
        # `skip_auth` is true):
        #   1. `token_provider` — a callable returning a GCP access token, called
        #      per attempt
        #   2. `google_credentials` — a `googleauth` credentials object (anything
        #      responding to `#apply`), refreshed by the library as needed
        #   3. Application Default Credentials (`Google::Auth.get_application_default`)
        #      with the `cloud-platform` scope
        #
        # @param project [String, nil] GCP consumer project id. Defaults to
        #   `ENV["ANTHROPIC_GOOGLE_CLOUD_PROJECT"]`, then
        #   `ENV["GOOGLE_CLOUD_PROJECT"]`, then the project reported by the
        #   resolved Google credentials. Only required when the base URL must be
        #   derived.
        #
        # @param location [String, nil] GCP location. Defaults to
        #   `ENV["ANTHROPIC_GOOGLE_CLOUD_LOCATION"]`, then `"global"`; an
        #   explicit `nil` falls back to the same defaults.
        #
        # @param workspace_id [String, nil] Defaults to
        #   `ENV["ANTHROPIC_GOOGLE_CLOUD_WORKSPACE_ID"]`. Required when the base
        #   URL is derived, except for organization-level routes
        #   (`/v1/organizations/`), which need no workspace ID.
        #
        # @param base_url [String, nil] Override the gateway base URL for every
        #   route. Defaults to `ENV["ANTHROPIC_GOOGLE_CLOUD_BASE_URL"]`, otherwise
        #   derived from `project`, `location`, and `workspace_id` via
        #   {URL_TEMPLATE}.
        #
        # @param google_credentials [#apply, nil] A `googleauth`-compatible
        #   credentials object. Mutually exclusive with `skip_auth`.
        #
        # @param token_provider [#call, nil] A callable returning a GCP access
        #   token string. Takes precedence over `google_credentials`. Mutually
        #   exclusive with `skip_auth`.
        #
        # @param skip_auth [Boolean] When true, no token is attached. For callers
        #   fronting with their own authenticated proxy. Mutually exclusive with
        #   `token_provider` and `google_credentials`.
        #
        # @param max_retries [Integer] Max number of retries to attempt after a
        #   failed retryable request.
        #
        # @param timeout [Float, nil] Request timeout in seconds. Defaults to
        #   `Anthropic::Client::DEFAULT_TIMEOUT_IN_SECONDS` when `nil`.
        #
        # @param initial_retry_delay [Float]
        #
        # @param max_retry_delay [Float]
        #
        # @param middleware [Array<#call>, #call, nil] Per-attempt HTTP
        #   around-middleware. See {Anthropic::Middleware}. The Google bearer
        #   is applied per attempt, after user middleware.
        #
        # @raise [ArgumentError]
        #
        # @param open_telemetry [Hash{Symbol=>Object}, Boolean, nil] OpenTelemetry tracing of this
        #   client's API calls. See {Anthropic::Client#initialize}.
        def initialize(
          project: ENV["ANTHROPIC_GOOGLE_CLOUD_PROJECT"] || ENV["GOOGLE_CLOUD_PROJECT"],
          location: ENV["ANTHROPIC_GOOGLE_CLOUD_LOCATION"] || "global",
          workspace_id: ENV["ANTHROPIC_GOOGLE_CLOUD_WORKSPACE_ID"],
          base_url: ENV["ANTHROPIC_GOOGLE_CLOUD_BASE_URL"],
          google_credentials: nil,
          token_provider: nil,
          skip_auth: false,
          max_retries: self.class::DEFAULT_MAX_RETRIES,
          timeout: nil,
          initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
          max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY,
          middleware: nil,
          open_telemetry: nil
        )
          if skip_auth && (token_provider || google_credentials)
            raise ArgumentError.new(
              "`skip_auth` is mutually exclusive with `token_provider` and `google_credentials`; " \
              "`skip_auth` disables authentication entirely."
            )
          end

          @skip_auth = skip_auth
          @token_provider = token_provider
          @authorization = google_credentials

          # Resolve credentials eagerly so the client is thread-safe (no lazy
          # ADC race) and so the credentials' project can backfill `project`
          # before the base URL is derived.
          if !skip_auth && token_provider.nil? && google_credentials.nil?
            require_googleauth
            @authorization = Google::Auth.get_application_default([SCOPE])
          end

          if project.nil? && @authorization.respond_to?(:project_id)
            project = @authorization.project_id
          end
          @project = project
          # The kwarg default doesn't fire on an explicitly-passed nil — coerce
          # so nil can't reach the derived URL (matches the other SDKs).
          @location = location || ENV["ANTHROPIC_GOOGLE_CLOUD_LOCATION"] || "global"

          @workspace_id = workspace_id

          base_url = nil if base_url.to_s.empty?
          unless base_url
            @organization_base_url = URI.parse(derive_base_url(ORGANIZATION_URL_TEMPLATE))
            # Without a workspace ID there is no workspace base to derive, so
            # `base_url` is the organization base.
            base_url = @workspace_id.nil? ? @organization_base_url.to_s : derive_base_url(URL_TEMPLATE)
          end

          # No first-party credential is ever passed up, and
          # {#resolve_default_credentials?} keeps the parent from discovering
          # one; `base_url` is always resolved by this point, so the parent's
          # `ANTHROPIC_BASE_URL` fallback never applies. The parent wires up
          # every resource; {#user_profiles} withholds the one the gateway does
          # not serve, and {#build_request} refuses the user profile routes
          # however the resource is reached.
          super(
            base_url: base_url,
            timeout: timeout,
            max_retries: max_retries,
            initial_retry_delay: initial_retry_delay,
            max_retry_delay: max_retry_delay,
            middleware: middleware,
            open_telemetry: open_telemetry
          )
        end

        # @api private
        #
        # @return [Boolean]
        # @see Anthropic::Client#resolve_default_credentials?
        private def resolve_default_credentials? = false

        # User profiles are not supported on the Google Cloud gateway.
        #
        # @raise [NotImplementedError]
        def user_profiles
          raise NotImplementedError.new("User profiles are not supported on the Google Cloud gateway.")
        end

        # @api private
        #
        # @param req [Hash{Symbol=>Object}] .
        #
        #   @option req [Symbol] :method
        #
        #   @option req [String, Array<String>] :path
        #
        #   @option req [Hash{String=>Array<String>, String, nil}, nil] :query
        #
        #   @option req [Hash{String=>String, Integer, Array<String, Integer, nil>, nil}, nil] :headers
        #
        #   @option req [Object, nil] :body
        #
        #   @option req [Symbol, Integer, Array<Symbol, Integer>, Proc, nil] :unwrap
        #
        #   @option req [Class<Anthropic::Internal::Type::BasePage>, nil] :page
        #
        #   @option req [Class<Anthropic::Internal::Type::BaseStream>, nil] :stream
        #
        #   @option req [Anthropic::Internal::Type::Converter, Class, nil] :model
        #
        # @param opts [Hash{Symbol=>Object}] .
        #
        #   @option opts [String, nil] :idempotency_key
        #
        #   @option opts [Hash{String=>Array<String>, String, nil}, nil] :extra_query
        #
        #   @option opts [Hash{String=>String, nil}, nil] :extra_headers
        #
        #   @option opts [Object, nil] :extra_body
        #
        #   @option opts [Integer, nil] :max_retries
        #
        #   @option opts [Float, nil] :timeout
        #
        # @raise [ArgumentError]
        # @raise [NotImplementedError]
        # @return [Hash{Symbol=>Object}]
        private def build_request(req, opts)
          # Id-parameterized routes pass `path` as an Array whose first element
          # is the format string (e.g. `["v1/user_profiles/%1$s", id]`).
          if Array(req[:path]).first.to_s.start_with?("v1/user_profiles")
            raise NotImplementedError.new("User profiles are not supported on the Google Cloud gateway.")
          end

          request = super
          return request if @organization_base_url.nil?

          url = request.fetch(:url)
          under_base_url =
            url.path.start_with?("#{base_url.path}/") &&
            Anthropic::Internal::Util.uri_origin(url) == Anthropic::Internal::Util.uri_origin(base_url)
          return request unless under_base_url

          path = url.path.delete_prefix(base_url.path)
          if path.start_with?(ORGANIZATION_PATH_PREFIX)
            url = url.dup
            url.path = "#{@organization_base_url.path}#{path}"
            {**request, url: url}
          elsif @workspace_id.nil?
            raise ArgumentError.new(
              "No workspace ID was given. Set the `workspace_id` argument or the " \
              "`ANTHROPIC_GOOGLE_CLOUD_WORKSPACE_ID` environment variable."
            )
          else
            request
          end
        end

        # @api private
        #
        # Hard guarantee that no first-party `Authorization` header from
        # static credentials reaches the wire; auth is the GCP
        # bearer token attached in {#provider_middleware}.
        #
        # @return [Hash{String=>String}]
        private def auth_headers = {}

        # @api private
        #
        # @return [String]
        private def open_telemetry_scope = "#{super}.google_cloud"

        # @api private
        #
        # The Google Cloud provider middleware: applies the Google OAuth
        # `authorization` bearer token. Appended innermost on every dispatch
        # (below user middleware) and runs per attempt. Pure — requests are reused across
        # retry attempts, so the incoming `req` is never mutated.
        #
        # @return [#call]
        private def provider_middleware
          lambda do |req, nxt|
            nxt.call(apply_auth(req))
          end
        end

        # @api private
        #
        # @param req [Anthropic::APIRequest]
        # @return [Anthropic::APIRequest]
        private def apply_auth(req)
          # `req.headers` is the deep-frozen hash a middleware saw; splat into a
          # fresh mutable copy so googleauth's `#apply` (which `clone`s then
          # `[]=`s) doesn't raise.
          headers = {**req.headers}

          # `follow_redirect` stripped `authorization` for a cross-origin hop —
          # don't re-add it and leak the bearer token to the new origin.
          if !@skip_auth && !req.metadata[:cross_origin_redirect] && !headers.key?("authorization")
            headers =
              if @token_provider
                headers.merge("authorization" => "Bearer #{@token_provider.call}")
              else
                @authorization.apply(headers)
              end
          end

          req.with(headers: headers)
        end

        # @api private
        #
        # @param template [String]
        # @return [String]
        # @raise [ArgumentError]
        private def derive_base_url(template)
          if @project.nil?
            raise ArgumentError.new(
              "No project found. Set the `project` argument, set the " \
              "`ANTHROPIC_GOOGLE_CLOUD_PROJECT` environment variable, or configure " \
              "application default credentials with a project."
            )
          end
          format(template, project: @project, location: @location, workspace_id: @workspace_id)
        end

        # @api private
        private def require_googleauth
          require("googleauth")
        rescue LoadError
          message = <<~MSG

            In order to use the Anthropic Google Cloud client you must require the `googleauth` gem.
            You can install it by adding the following to your Gemfile:

                gem "googleauth"

            and then running `bundle install`.

            Alternatively, if you are not using Bundler, simply run:

                gem install googleauth
          MSG

          raise RuntimeError.new(message)
        end
      end
    end
  end
end
