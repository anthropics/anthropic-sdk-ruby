# typed: strong

module Anthropic
  module Helpers
    module GoogleCloud
      class Client < Anthropic::Client
        SCOPE = "https://www.googleapis.com/auth/cloud-platform"

        sig { returns(T.nilable(String)) }
        attr_reader :project

        sig { returns(T.nilable(String)) }
        attr_reader :location

        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { returns(Anthropic::Resources::Messages) }
        attr_reader :messages

        sig { returns(Anthropic::Resources::Models) }
        attr_reader :models

        sig { returns(Anthropic::Resources::Beta) }
        attr_reader :beta

        sig { returns(T.noreturn) }
        def completions
        end

        # @api private
        sig { override.returns(T::Hash[String, String]) }
        private def auth_headers
        end

        # @api private
        sig { override.returns(Anthropic::Middleware::Entry) }
        private def provider_middleware
        end

        # @api private
        sig { params(req: Anthropic::APIRequest).returns(Anthropic::APIRequest) }
        private def apply_auth(req)
        end

        # @api private
        sig { returns(String) }
        private def derive_base_url
        end

        sig do
          params(
            project: T.nilable(String),
            location: T.nilable(String),
            workspace_id: T.nilable(String),
            base_url: T.nilable(String),
            google_credentials: T.untyped,
            token_provider: T.nilable(T.proc.returns(String)),
            skip_auth: T::Boolean,
            max_retries: Integer,
            timeout: Float,
            initial_retry_delay: Float,
            max_retry_delay: Float,
            middleware: T.nilable(Anthropic::Middleware::EntryOrArray)
          ).returns(T.attached_class)
        end
        def self.new(
          project: nil,
          location: nil,
          workspace_id: nil,
          base_url: nil,
          google_credentials: nil,
          token_provider: nil,
          skip_auth: false,
          max_retries: Anthropic::Client::DEFAULT_MAX_RETRIES,
          timeout: Anthropic::Client::DEFAULT_TIMEOUT_IN_SECONDS,
          initial_retry_delay: Anthropic::Client::DEFAULT_INITIAL_RETRY_DELAY,
          max_retry_delay: Anthropic::Client::DEFAULT_MAX_RETRY_DELAY,
          # Per-attempt HTTP around-middleware. The Google bearer is applied
          # per attempt, after user middleware.
          middleware: nil
        )
        end
      end
    end
  end
end
