# typed: strong

module Anthropic
  module Helpers
    module Vertex
      class Client < Anthropic::Client
        DEFAULT_VERSION = "vertex-2023-10-16"

        sig { returns(String) }
        attr_reader :region

        sig { returns(String) }
        attr_reader :project_id

        sig { returns(Anthropic::Resources::Messages) }
        attr_reader :messages

        sig { returns(Anthropic::Resources::Beta) }
        attr_reader :beta

        # @api private
        sig do
          override
            .params(
              req:
                Anthropic::Internal::Transport::BaseClient::RequestComponents,
              opts: Anthropic::Internal::AnyHash
            )
            .returns(Anthropic::Internal::Transport::BaseClient::RequestInput)
        end
        private def build_request(req, opts)
        end

        # @api private
        sig { override.returns(Anthropic::Middleware::Entry) }
        private def provider_middleware
        end

        # @api private
        sig { params(req: Anthropic::APIRequest).returns(Anthropic::APIRequest) }
        private def adapt_request(req)
        end

        # @api private
        sig { params(req: Anthropic::APIRequest).returns(Anthropic::APIRequest) }
        private def apply_google_auth(req)
        end

        # @api private
        sig do
          params(
            url: URI::Generic,
            pattern: Regexp,
            replacement: String
          ).returns(URI::Generic)
        end
        private def rewrite_path(url, pattern, replacement)
        end

        sig do
          params(
            region: T.nilable(String),
            project_id: T.nilable(String),
            base_url: T.nilable(String),
            max_retries: Integer,
            timeout: Float,
            initial_retry_delay: Float,
            max_retry_delay: Float,
            middleware: T.nilable(Anthropic::Middleware::EntryOrArray)
          ).returns(T.attached_class)
        end
        def self.new(
          region: ENV["CLOUD_ML_REGION"],
          project_id: ENV["ANTHROPIC_VERTEX_PROJECT_ID"],
          base_url: nil,
          max_retries: Anthropic::Client::DEFAULT_MAX_RETRIES,
          timeout: Anthropic::Client::DEFAULT_TIMEOUT_IN_SECONDS,
          initial_retry_delay: Anthropic::Client::DEFAULT_INITIAL_RETRY_DELAY,
          max_retry_delay: Anthropic::Client::DEFAULT_MAX_RETRY_DELAY,
          # Per-attempt HTTP around-middleware. Middleware sees the canonical
          # Anthropic request shape; the Vertex URL rewrite and OAuth header
          # happen inside the continuation, per attempt.
          middleware: nil
        )
        end
      end
    end
  end
end
