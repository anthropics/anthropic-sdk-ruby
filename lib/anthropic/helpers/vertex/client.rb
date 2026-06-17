# frozen_string_literal: true

module Anthropic
  module Helpers
    module Vertex
      class Client < Anthropic::Client
        DEFAULT_VERSION = "vertex-2023-10-16"

        # @return [String]
        attr_reader :region

        # @return [String]
        attr_reader :project_id

        # @return [Anthropic::Resources::Messages]
        attr_reader :messages

        # @return [Anthropic::Resources::Beta]
        attr_reader :beta

        # Creates and returns a new client for interacting with the GCP Vertex API for Anthropic models.
        #
        # GCP credentials are resolved according to Application Default Credentials, described at
        #   https://cloud.google.com/docs/authentication/provide-credentials-adc
        #
        # @param region [String, nil] Enforce the GCP Region to use. If unset, the region may be set with the CLOUD_ML_REGION environment variable.
        #
        # @param project_id [String, nil] Enforce the GCP Project ID to use. If unset, the project_id may be set with the ANTHROPIC_VERTEX_PROJECT_ID environment variable.
        #
        # @param base_url [String, nil] Override the default base URL for the API, e.g., `"https://api.example.com/v2/"`
        #
        # @param max_retries [Integer] The maximum number of times to retry a request if it fails
        #
        # @param timeout [Float] The number of seconds to wait for a response before timing out
        #
        # @param initial_retry_delay [Float] The number of seconds to wait before retrying a request
        #
        # @param max_retry_delay [Float] The maximum number of seconds to wait before retrying a request
        #
        # @param middleware [Array<#call>, #call, nil] Per-attempt HTTP around-middleware. See
        #   {Anthropic::Middleware}. Middleware sees the canonical Anthropic request shape;
        #   the Vertex URL rewrite and OAuth header happen inside the continuation, per
        #   attempt.
        #
        def initialize(
          region: ENV["CLOUD_ML_REGION"],
          project_id: ENV["ANTHROPIC_VERTEX_PROJECT_ID"],
          base_url: nil,
          max_retries: DEFAULT_MAX_RETRIES,
          timeout: DEFAULT_TIMEOUT_IN_SECONDS,
          initial_retry_delay: DEFAULT_INITIAL_RETRY_DELAY,
          max_retry_delay: DEFAULT_MAX_RETRY_DELAY,
          middleware: nil
        )
          begin
            require("googleauth")
          rescue LoadError
            message = <<~MSG

              In order to access Anthropic models on Vertex you must require the `googleauth` gem.
              You can install it by adding the following to your Gemfile:

                  gem "googleauth"

              and then running `bundle install`.

              Alternatively, if you are not using Bundler, simply run:

                  gem install googleauth
            MSG

            raise RuntimeError.new(message)
          end

          if region.to_s.empty?
            # rubocop:disable Layout/LineLength
            message = "No region was given. The client should be instantiated with the `region` argument or the `CLOUD_ML_REGION` environment variable should be set."
            # rubocop:enable Layout/LineLength
            raise ArgumentError.new(message)
          end
          @region = region

          if project_id.to_s.empty?
            # rubocop:disable Layout/LineLength
            message = "No project_id was given and it could not be resolved from credentials. The client should be instantiated with the `project_id` argument or the `ANTHROPIC_VERTEX_PROJECT_ID` environment variable should be set."
            # rubocop:enable Layout/LineLength
            raise ArgumentError.new(message)
          end
          @project_id = project_id
          @authorization = nil

          base_url ||= ENV.fetch(
            "ANTHROPIC_VERTEX_BASE_URL",
            case @region.to_s
            when "global"
              "https://aiplatform.googleapis.com/v1"
            when "us"
              "https://aiplatform.us.rep.googleapis.com/v1"
            when "eu"
              "https://aiplatform.eu.rep.googleapis.com/v1"
            else
              "https://#{@region}-aiplatform.googleapis.com/v1"
            end
          )

          super(
            base_url: base_url,
            timeout: timeout,
            max_retries: max_retries,
            initial_retry_delay: initial_retry_delay,
            max_retry_delay: max_retry_delay,
            middleware: middleware
          )

          @messages = Anthropic::Resources::Messages.new(client: self)
          @beta = Anthropic::Resources::Beta.new(client: self)
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
        # @return [Hash{Symbol=>Object}]
        private def build_request(req, opts)
          # Id-parameterized routes pass `path` as an Array whose first element
          # is the format string (e.g. `["v1/messages/batches/%1$s", id]`).
          path = Array(req[:path]).first.to_s
          if path.start_with?("v1/messages/batches")
            raise NotImplementedError.new("The Batch API is not supported in the Vertex client yet")
          end

          super
        end

        # @api private
        #
        # The Vertex provider middleware: rewrites the canonical request into
        # Vertex's shape and applies the Google OAuth `authorization` header.
        # Appended innermost on every dispatch (below user middleware) and runs
        # per attempt, so a middleware that re-issues the request gets a fresh
        # token per leg, mirroring the Bedrock SigV4 placement.
        #
        # @return [#call]
        private def provider_middleware
          lambda do |req, nxt|
            nxt.call(apply_google_auth(adapt_request(req)))
          end
        end

        # @api private
        #
        # @param req [Anthropic::APIRequest]
        # @return [Anthropic::APIRequest]
        private def apply_google_auth(req)
          return req if req.headers.key?("authorization")
          # `follow_redirect` stripped `authorization` for a cross-origin hop —
          # don't re-add it and leak the bearer token to the new origin.
          return req if req.metadata[:cross_origin_redirect]

          # Memoized: the credentials object caches its token and self-refreshes
          # on expiry, so each retry leg still gets a fresh-enough token without
          # re-resolving ADC (a blocking metadata-server/token-endpoint
          # round-trip) on every attempt.
          authorization =
            @authorization ||= Google::Auth.get_application_default(["https://www.googleapis.com/auth/cloud-platform"])
          # `req.headers` may be the deep-frozen hash a middleware saw, and
          # googleauth's `#apply` does `clone` (which preserves frozen) then
          # `[]=` — so it must be handed a fresh, mutable copy.
          req.with(headers: authorization.apply({**req.headers}))
        end

        # @api private
        #
        # Rewrites the canonical Anthropic request into Vertex's shape — drops
        # `:model` from the body (keeping `:stream`) and retargets the URL to
        # `projects/{project}/locations/{region}/publishers/anthropic/models/{model}:{rawPredict|streamRawPredict}`.
        # Called from {#provider_middleware}, so user middleware sees the
        # canonical request. Pure: the incoming request, its body, headers,
        # and URI are never mutated (they are reused across retry attempts).
        #
        # @param req [Anthropic::APIRequest]
        # @return [Anthropic::APIRequest]
        private def adapt_request(req)
          body = req.body
          headers = req.headers
          url = req.url
          path = url.path.to_s
          query_ok = url.query.nil? || url.query == "beta=true"

          if body.is_a?(Hash)
            body = body.dup
            body[:anthropic_version] ||= DEFAULT_VERSION

            if (anthropic_beta = body.delete(:"anthropic-beta"))
              headers = headers.merge("anthropic-beta" => Array(anthropic_beta).join(","))
            end
          end

          if req.method == :post && query_ok && path.end_with?("/v1/messages")
            unless body.is_a?(Hash)
              raise ArgumentError.new("Expected json data to be a hash for post /v1/messages")
            end

            model = body.delete(:model)
            specifier = body[:stream] ? "streamRawPredict" : "rawPredict"

            url = rewrite_path(
              url,
              %r{v1/messages\z},
              "projects/#{@project_id}/locations/#{region}/publishers/anthropic/models/#{model}:#{specifier}"
            )
          elsif req.method == :post && query_ok && path.end_with?("/v1/messages/count_tokens")
            url = rewrite_path(
              url,
              %r{v1/messages/count_tokens\z},
              "projects/#{@project_id}/locations/#{region}/publishers/anthropic/" \
              "models/count-tokens:rawPredict"
            )
          end

          return req if body.equal?(req.body) && headers.equal?(req.headers) && url.equal?(req.url)
          req.with(body: body, headers: headers, url: url)
        end

        # @api private
        #
        # Retarget `url`'s path (replacing `pattern` with `replacement`) and drop
        # its query, returning a fresh copy so the incoming request's URI is left
        # untouched.
        #
        # @param url [URI::Generic]
        # @param pattern [Regexp]
        # @param replacement [String]
        # @return [URI::Generic]
        private def rewrite_path(url, pattern, replacement)
          url = url.dup
          url.path = url.path.to_s.sub(pattern, replacement)
          url.query = nil
          url
        end
      end
    end
  end
end
