# typed: strong

module Anthropic
  module Helpers
    module Bedrock
      class MantleClient < Anthropic::Client
        sig { returns(T.nilable(String)) }
        attr_reader :aws_region

        sig { returns(Anthropic::Resources::Messages) }
        attr_reader :messages

        sig { returns(Anthropic::Resources::Beta) }
        attr_reader :beta

        sig do
          params(
            api_key: T.nilable(String),
            aws_access_key: T.nilable(String),
            aws_secret_access_key: T.nilable(String),
            aws_session_token: T.nilable(String),
            aws_profile: T.nilable(String),
            aws_region: T.nilable(String),
            skip_auth: T::Boolean,
            base_url: T.nilable(String),
            max_retries: Integer,
            timeout: Float,
            initial_retry_delay: Float,
            max_retry_delay: Float
          ).returns(T.attached_class)
        end
        def self.new(
          api_key: nil,
          aws_access_key: nil,
          aws_secret_access_key: nil,
          aws_session_token: nil,
          aws_profile: nil,
          aws_region: nil,
          skip_auth: false,
          base_url: nil,
          max_retries: Anthropic::Client::DEFAULT_MAX_RETRIES,
          timeout: Anthropic::Client::DEFAULT_TIMEOUT_IN_SECONDS,
          initial_retry_delay: Anthropic::Client::DEFAULT_INITIAL_RETRY_DELAY,
          max_retry_delay: Anthropic::Client::DEFAULT_MAX_RETRY_DELAY
        )
        end

        sig { returns(T.noreturn) }
        def completions
        end

        sig { returns(T.noreturn) }
        def models
        end

        sig do
          params(request: Anthropic::Internal::AnyHash)
            .returns(Anthropic::Internal::AnyHash)
        end
        private def transform_request(request)
        end
      end
    end
  end
end
