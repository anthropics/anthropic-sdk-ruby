# typed: strong

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

        sig { returns(T.nilable(String)) }
        attr_reader :resource

        sig { returns(T.noreturn) }
        def models
        end

        # @api private
        sig { override.returns(T::Boolean) }
        private def resolve_default_credentials?
        end

        # @api private
        sig { override.returns(T::Hash[String, String]) }
        private def auth_headers
        end

        # @api private
        sig { override.returns(String) }
        private def open_telemetry_scope
        end

        # @api private
        sig { override.returns(Anthropic::Middleware::Entry) }
        private def provider_middleware
        end

        # @api private
        sig do
          params(req: Anthropic::APIRequest).returns(Anthropic::APIRequest)
        end
        private def buffer_body(req)
        end

        # @api private
        sig do
          params(req: Anthropic::APIRequest).returns(Anthropic::APIRequest)
        end
        private def apply_auth(req)
        end

        # @api private
        sig do
          params(arg: T.nilable(String), env: String).returns(T.nilable(String))
        end
        private def arg_or_env(arg, env)
        end

        # Creates and returns a new client for interacting with Claude in Microsoft
        # Foundry.
        #
        # Authentication is either an API key, sent as `x-api-key`, or a Microsoft Entra
        # ID token from `azure_ad_token_provider`, sent as a bearer token.
        sig do
          params(
            resource: T.nilable(String),
            api_key: T.nilable(String),
            azure_ad_token_provider: T.nilable(T.proc.returns(String)),
            base_url: T.nilable(String),
            max_retries: Integer,
            timeout: T.nilable(Float),
            initial_retry_delay: Float,
            max_retry_delay: Float,
            middleware: T.nilable(Anthropic::Middleware::EntryOrArray),
            open_telemetry:
              T.nilable(T.any(T::Boolean, Anthropic::Internal::AnyHash))
          ).returns(T.attached_class)
        end
        def self.new(
          # Foundry resource name, e.g. `"example-resource"` for
          # `https://example-resource.services.ai.azure.com/anthropic/`. Defaults to
          # `ENV["ANTHROPIC_FOUNDRY_RESOURCE"]`. Mutually exclusive with `base_url`.
          resource: nil,
          # Defaults to `ENV["ANTHROPIC_FOUNDRY_API_KEY"]`, which is ignored when
          # `azure_ad_token_provider` is given. Mutually exclusive with
          # `azure_ad_token_provider`.
          api_key: nil,
          # A callable returning a Microsoft Entra ID access token for `ENTRA_ID_SCOPE`.
          # Called per attempt, so it should cache the token.
          azure_ad_token_provider: nil,
          # Override the resource-derived base URL, e.g. for a private link or proxy.
          # Defaults to `ENV["ANTHROPIC_FOUNDRY_BASE_URL"]`.
          base_url: nil,
          # Max number of retries to attempt after a failed retryable request.
          max_retries: Anthropic::Client::DEFAULT_MAX_RETRIES,
          # Request timeout in seconds. Defaults to
          # `Anthropic::Client::DEFAULT_TIMEOUT_IN_SECONDS` when `nil`.
          timeout: nil,
          initial_retry_delay: Anthropic::Client::DEFAULT_INITIAL_RETRY_DELAY,
          max_retry_delay: Anthropic::Client::DEFAULT_MAX_RETRY_DELAY,
          # Per-attempt HTTP around-middleware. The Entra ID bearer is applied per
          # attempt, after user middleware.
          middleware: nil,
          # OpenTelemetry tracing of this client's API calls. See {Anthropic::Client}.
          open_telemetry: nil
        )
        end
      end
    end
  end
end
