# frozen_string_literal: true

module Anthropic
  module Helpers
    module Foundry
      # Client for Claude in Microsoft Foundry, which serves the Claude API under
      # `https://{resource}.services.ai.azure.com/anthropic/`.
      #
      # The `model` in a request is the name of your deployment, which defaults
      # to the model ID. Foundry does not serve the Models API or the Message
      # Batches API. Files and Skills need a deployment hosted on Anthropic.
      class Client < Anthropic::Client
        # Scope to request for the tokens `azure_ad_token_provider` returns.
        ENTRA_ID_SCOPE = "https://ai.azure.com/.default"

        URL_TEMPLATE = "https://%<resource>s.services.ai.azure.com/anthropic/"

        private_constant :URL_TEMPLATE

        # @return [String, nil]
        attr_reader :resource

        # Creates and returns a new client for interacting with Claude in Microsoft Foundry.
        #
        # Authentication is either an API key, sent as `x-api-key`, or a Microsoft
        # Entra ID token from `azure_ad_token_provider`, sent as a bearer token.
        #
        # @param resource [String, nil] Foundry resource name, e.g. `"example-resource"` for
        #   `https://example-resource.services.ai.azure.com/anthropic/`. Defaults to
        #   `ENV["ANTHROPIC_FOUNDRY_RESOURCE"]`. Mutually exclusive with `base_url`.
        #
        # @param api_key [String, nil] Defaults to `ENV["ANTHROPIC_FOUNDRY_API_KEY"]`, which is
        #   ignored when `azure_ad_token_provider` is given. Mutually exclusive with
        #   `azure_ad_token_provider`.
        #
        # @param azure_ad_token_provider [#call, nil] A callable returning a Microsoft Entra ID
        #   access token for {ENTRA_ID_SCOPE}. Called per attempt, so it should cache the token.
        #
        # @param base_url [String, nil] Override the resource-derived base URL, e.g. for a private
        #   link or proxy. Defaults to `ENV["ANTHROPIC_FOUNDRY_BASE_URL"]`.
        #
        # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
        #
        # @param timeout [Float, nil] Request timeout in seconds. Defaults to
        #   `Anthropic::Client::DEFAULT_TIMEOUT_IN_SECONDS` when `nil`.
        #
        # @param initial_retry_delay [Float]
        #
        # @param max_retry_delay [Float]
        #
        # @param middleware [Array<#call>, #call, nil] Per-attempt HTTP around-middleware. See
        #   {Anthropic::Middleware}. The Entra ID bearer is applied per attempt, after user
        #   middleware.
        #
        # @param open_telemetry [Hash{Symbol=>Object}, Boolean, nil] OpenTelemetry tracing of this
        #   client's API calls. See {Anthropic::Client#initialize}.
        #
        # @raise [ArgumentError]
        def initialize(
          resource: nil,
          api_key: nil,
          azure_ad_token_provider: nil,
          base_url: nil,
          max_retries: self.class::DEFAULT_MAX_RETRIES,
          timeout: nil,
          initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
          max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY,
          middleware: nil,
          open_telemetry: nil
        )
          if azure_ad_token_provider
            unless api_key.to_s.strip.empty?
              raise ArgumentError.new(
                "`api_key` and `azure_ad_token_provider` are mutually exclusive; pass only one."
              )
            end
            api_key = nil
          else
            api_key = arg_or_env(api_key, "ANTHROPIC_FOUNDRY_API_KEY")
            if api_key.nil?
              raise ArgumentError.new(
                "Missing credentials. Set the `api_key` or `azure_ad_token_provider` argument, or the " \
                "`ANTHROPIC_FOUNDRY_API_KEY` environment variable."
              )
            end
          end
          @azure_ad_token_provider = azure_ad_token_provider

          @resource = arg_or_env(resource, "ANTHROPIC_FOUNDRY_RESOURCE")
          base_url = arg_or_env(base_url, "ANTHROPIC_FOUNDRY_BASE_URL")
          if base_url && @resource
            raise ArgumentError.new(
              "`base_url` (or `ANTHROPIC_FOUNDRY_BASE_URL`) and `resource` (or " \
              "`ANTHROPIC_FOUNDRY_RESOURCE`) are mutually exclusive; set only one."
            )
          end
          if base_url.nil? && @resource.nil?
            raise ArgumentError.new(
              "No endpoint was given. Set the `resource` or `base_url` argument, or the " \
              "`ANTHROPIC_FOUNDRY_RESOURCE` or `ANTHROPIC_FOUNDRY_BASE_URL` environment variable."
            )
          end
          unless @resource.nil? || @resource.match?(/\A[a-z0-9]([a-z0-9-]{0,61}[a-z0-9])?\z/i)
            raise ArgumentError.new(
              "`resource` must be a Foundry resource name such as `example-resource`, not a hostname or " \
              "URL. Use `base_url` for any other endpoint."
            )
          end
          base_url ||= format(URL_TEMPLATE, resource: @resource)

          super(
            api_key: api_key,
            base_url: base_url,
            timeout: timeout,
            max_retries: max_retries,
            initial_retry_delay: initial_retry_delay,
            max_retry_delay: max_retry_delay,
            middleware: middleware,
            open_telemetry: open_telemetry
          )

          @beta.define_singleton_method(:models) do
            raise NotImplementedError.new("The Models API is not supported on Microsoft Foundry.")
          end
          [@messages, @beta.messages].each do |messages|
            messages.define_singleton_method(:batches) do
              raise NotImplementedError.new("The Message Batches API is not supported on Microsoft Foundry.")
            end
          end
        end

        # @raise [NotImplementedError]
        def models
          raise NotImplementedError.new("The Models API is not supported on Microsoft Foundry.")
        end

        # @api private
        #
        # @return [Boolean]
        # @see Anthropic::Client#resolve_default_credentials?
        private def resolve_default_credentials? = false

        # @api private
        #
        # @return [Hash{String=>String}]
        private def auth_headers = @api_key.nil? ? {} : {"x-api-key" => @api_key}

        # @api private
        #
        # @return [String]
        private def open_telemetry_scope = "#{super}.foundry"

        # @api private
        #
        # @return [#call]
        private def provider_middleware = ->(req, nxt) { nxt.call(apply_auth(buffer_body(req))) }

        # @api private
        #
        # @param req [Anthropic::APIRequest]
        #
        # @return [Anthropic::APIRequest]
        private def buffer_body(req)
          return req unless req.headers["content-type"]&.start_with?("multipart/form-data")

          case Anthropic::Internal::Util.encode_content(req.headers, req.body)
          in [headers, Enumerator => chunks]
            req.with(headers: headers, body: StringIO.new(chunks.each_with_object("".b) { _2 << _1.b }))
          else
            req
          end
        end

        # @api private
        #
        # @param req [Anthropic::APIRequest]
        #
        # @return [Anthropic::APIRequest]
        # @raise [Anthropic::Errors::ConfigurationError]
        private def apply_auth(req)
          if req.metadata[:cross_origin_redirect]
            return req.with(headers: req.headers.reject { |name, _| name.casecmp?("x-api-key") })
          end
          return req if @azure_ad_token_provider.nil?
          return req if req.headers.each_key.any? { _1.casecmp?("authorization") }

          case @azure_ad_token_provider.call
          in String => token unless token.strip.empty?
            req.with(headers: req.headers.merge("authorization" => "Bearer #{token.strip}"))
          in token
            raise Anthropic::Errors::ConfigurationError.new(
              "Expected `azure_ad_token_provider` to return a non-empty String, got #{token.class}."
            )
          end
        end

        # @api private
        #
        # @param arg [String, nil]
        # @param env [String]
        #
        # @return [String, nil]
        private def arg_or_env(arg, env) = [arg, ENV[env]].find { !_1.to_s.strip.empty? }
      end
    end
  end
end
