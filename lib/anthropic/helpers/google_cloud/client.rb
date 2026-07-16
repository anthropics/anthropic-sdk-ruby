# frozen_string_literal: true

module Anthropic
  module Helpers
    module GoogleCloud
      # Client for Claude Platform on Google Cloud — the first-party Anthropic
      # API served through the Google Cloud gateway.
      #
      # This is distinct from {Anthropic::VertexClient}, which targets the
      # `:rawPredict` publisher-model API (publisher model IDs, messages
      # only). This client speaks the full first-party Anthropic API: requests
      # pass through the gateway unchanged — standard `/v1/*` paths, standard
      # model names, the complete API surface. The deprecated text Completions
      # endpoint is intentionally not exposed.
      class Client < Anthropic::Client
        # OAuth2 scope required to call the gateway.
        SCOPE = "https://www.googleapis.com/auth/cloud-platform"

        # Gateway base URL template; override via `base_url` or
        # `ANTHROPIC_GOOGLE_CLOUD_BASE_URL`.
        URL_TEMPLATE =
          "https://claude.googleapis.com/v1alpha" \
          "/projects/%<project>s/locations/%<location>s/workspaces/%<workspace_id>s/invoke"

        # @return [String, nil]
        attr_reader :project

        # @return [String, nil]
        attr_reader :location

        # @return [String, nil]
        attr_reader :workspace_id

        # @return [Anthropic::Resources::Messages]
        attr_reader :messages

        # @return [Anthropic::Resources::Models]
        attr_reader :models

        # @return [Anthropic::Resources::Beta]
        attr_reader :beta

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
        #   `ENV["ANTHROPIC_GOOGLE_CLOUD_WORKSPACE_ID"]`. Required unless
        #   `skip_auth` is true and an explicit `base_url` is given.
        #
        # @param base_url [String, nil] Override the gateway base URL. Defaults to
        #   `ENV["ANTHROPIC_GOOGLE_CLOUD_BASE_URL"]`, otherwise derived from
        #   `project`, `location`, and `workspace_id` via {URL_TEMPLATE}.
        #
        # @param google_credentials [#apply, nil] A `googleauth`-compatible
        #   credentials object. Mutually exclusive with `skip_auth`.
        #
        # @param token_provider [#call, nil] A callable returning a GCP access
        #   token string. Takes precedence over `google_credentials`. Mutually
        #   exclusive with `skip_auth`.
        #
        # @param skip_auth [Boolean] When true, no token is attached and
        #   `workspace_id` is only required when the base URL must be derived.
        #   For callers fronting with their own authenticated proxy. Mutually
        #   exclusive with `token_provider` and `google_credentials`.
        #
        # @param max_retries [Integer] Max number of retries to attempt after a
        #   failed retryable request.
        #
        # @param timeout [Float]
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
        def initialize( # rubocop:disable Lint/MissingSuper
          project: ENV["ANTHROPIC_GOOGLE_CLOUD_PROJECT"] || ENV["GOOGLE_CLOUD_PROJECT"],
          location: ENV["ANTHROPIC_GOOGLE_CLOUD_LOCATION"] || "global",
          workspace_id: ENV["ANTHROPIC_GOOGLE_CLOUD_WORKSPACE_ID"],
          base_url: ENV["ANTHROPIC_GOOGLE_CLOUD_BASE_URL"],
          google_credentials: nil,
          token_provider: nil,
          skip_auth: false,
          max_retries: self.class::DEFAULT_MAX_RETRIES,
          timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
          initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
          max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY,
          middleware: nil
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

          if workspace_id.nil? && !skip_auth
            raise ArgumentError.new(
              "No workspace ID was given. Set the `workspace_id` argument or the " \
              "`ANTHROPIC_GOOGLE_CLOUD_WORKSPACE_ID` environment variable."
            )
          end
          @workspace_id = workspace_id

          base_url = derive_base_url if base_url.nil?

          # Never inherit first-party Anthropic credentials from the
          # environment: clear the ivars `Anthropic::Client#auth_headers` reads,
          # and bind `BaseClient#initialize` directly so the parent's
          # credential-provider / `ANTHROPIC_BASE_URL` resolution is skipped
          # entirely.
          @api_key = nil
          @auth_token = nil
          @credentials = nil
          @token_cache = nil

          Anthropic::Internal::Transport::BaseClient.instance_method(:initialize).bind(self).call(
            base_url: base_url,
            timeout: timeout,
            max_retries: max_retries,
            initial_retry_delay: initial_retry_delay,
            max_retry_delay: max_retry_delay,
            headers: {"anthropic-version" => "2023-06-01"},
            middleware: middleware
          )

          @messages = Anthropic::Resources::Messages.new(client: self)
          @models = Anthropic::Resources::Models.new(client: self)
          @beta = Anthropic::Resources::Beta.new(client: self)
        end

        # The deprecated text Completions endpoint is not supported on the
        # Google Cloud gateway.
        #
        # @raise [NotImplementedError]
        def completions
          raise NotImplementedError.new(
            "The deprecated text Completions API is not supported on the Google Cloud gateway."
          )
        end

        # @api private
        #
        # Hard guarantee that no first-party `X-Api-Key` / `Authorization`
        # header from static credentials reaches the wire; auth is the GCP
        # bearer token attached in {#provider_middleware}.
        #
        # @return [Hash{String=>String}]
        private def auth_headers = {}

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
        # @return [String]
        # @raise [ArgumentError]
        private def derive_base_url
          if @project.nil?
            raise ArgumentError.new(
              "No project found. Set the `project` argument, set the " \
              "`ANTHROPIC_GOOGLE_CLOUD_PROJECT` environment variable, or configure " \
              "application default credentials with a project."
            )
          end
          if @workspace_id.nil?
            raise ArgumentError.new(
              "No workspace ID was given. Set the `workspace_id` argument or the " \
              "`ANTHROPIC_GOOGLE_CLOUD_WORKSPACE_ID` environment variable."
            )
          end
          format(URL_TEMPLATE, project: @project, location: @location, workspace_id: @workspace_id)
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
