# typed: strong

module Anthropic
  module Helpers
    module Bedrock
      class Client < Anthropic::Client
        DEFAULT_VERSION = "bedrock-2023-05-31"

        sig { returns(String) }
        attr_reader :aws_region

        sig { returns(Anthropic::Resources::Completions) }
        attr_reader :completions

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
          params(
            aws_region: T.nilable(String),
            aws_access_key: T.nilable(String),
            aws_secret_key: T.nilable(String),
            aws_session_token: T.nilable(String),
            aws_profile: T.nilable(String)
          ).returns(T::Array[T.anything])
        end
        private def resolve_region_and_credentials(
          aws_region:,
          aws_access_key:,
          aws_secret_key:,
          aws_session_token:,
          aws_profile:
        )
        end

        sig do
          params(request_components: Anthropic::Internal::Transport::BaseClient::RequestComponents)
            .returns(Anthropic::Internal::Transport::BaseClient::RequestComponents)
        end
        private def fit_req_to_bedrock_specs!(request_components) end

        sig do
          params(
            aws_region: T.nilable(String),
            base_url: T.nilable(String),
            max_retries: Integer,
            timeout: Float,
            initial_retry_delay: Float,
            max_retry_delay: Float,
            aws_access_key: T.nilable(String),
            aws_secret_key: T.nilable(String),
            aws_session_token: T.nilable(String),
            aws_profile: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          aws_region: nil,
          base_url: nil,
          max_retries: Anthropic::Client::DEFAULT_MAX_RETRIES,
          timeout: Anthropic::Client::DEFAULT_TIMEOUT_IN_SECONDS,
          initial_retry_delay: Anthropic::Client::DEFAULT_INITIAL_RETRY_DELAY,
          max_retry_delay: Anthropic::Client::DEFAULT_MAX_RETRY_DELAY,
          aws_access_key: nil,
          aws_secret_key: nil,
          aws_session_token: nil,
          aws_profile: nil
        ) end
      end
    end
  end
end
