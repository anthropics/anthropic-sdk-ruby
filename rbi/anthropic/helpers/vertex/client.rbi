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
            .params(req: Anthropic::Internal::Transport::BaseClient::RequestComponents, opts: Anthropic::Internal::AnyHash)
            .returns(Anthropic::Internal::Transport::BaseClient::RequestInput)
        end
        private def build_request(req, opts); end

        sig do
          params(request_components: Anthropic::Internal::Transport::BaseClient::RequestComponents)
            .returns(Anthropic::Internal::Transport::BaseClient::RequestComponents)
        end
        private def fit_req_to_vertex_specs!(request_components) end

        sig do
          params(
            region: T.nilable(String),
            project_id: T.nilable(String),
            base_url: T.nilable(String),
            max_retries: Integer,
            timeout: Float,
            initial_retry_delay: Float,
            max_retry_delay: Float
          ).returns(T.attached_class)
        end
        def self.new(
          region: ENV["CLOUD_ML_REGION"],
          project_id: ENV["ANTHROPIC_VERTEX_PROJECT_ID"],
          base_url: nil,
          max_retries: Anthropic::Client::DEFAULT_MAX_RETRIES,
          timeout: Anthropic::Client::DEFAULT_TIMEOUT_IN_SECONDS,
          initial_retry_delay: Anthropic::Client::DEFAULT_INITIAL_RETRY_DELAY,
          max_retry_delay: Anthropic::Client::DEFAULT_MAX_RETRY_DELAY
        ) end
      end
    end
  end
end
