# frozen_string_literal: true

module Anthropic
  module Helpers
    module Bedrock
      # Client for the Anthropic Bedrock Mantle API. Only the Messages API (/v1/messages)
      # and its subpaths are supported.
      #
      # Auth is resolved by the same precedence as the AWS gateway client, with
      # Mantle-specific environment variables that fall back to the AWS equivalents:
      #
      #   1. `api_key` constructor arg → API key mode (x-api-key header, no SigV4)
      #   2. `aws_access_key` + `aws_secret_access_key` args → SigV4 with explicit credentials
      #   3. `aws_profile` arg → SigV4 with named AWS profile
      #   4. `AWS_BEARER_TOKEN_BEDROCK` env (then `ANTHROPIC_AWS_API_KEY`) → API key mode
      #   5. Default AWS credential chain → SigV4
      class MantleClient < Anthropic::Client
        include Anthropic::Helpers::AWSAuth

        # @return [String, nil]
        attr_reader :aws_region

        # @return [Anthropic::Resources::Messages]
        attr_reader :messages

        # @return [Anthropic::Helpers::Bedrock::MantleClient::MantleBeta]
        attr_reader :beta

        # Creates and returns a new client for interacting with Anthropic models via Bedrock Mantle.
        # Only the Messages API (/v1/messages) is supported.
        #
        # @param api_key [String, nil] Anthropic API key (bypasses SigV4, uses x-api-key header)
        #
        # @param aws_access_key [String, nil] AWS access key ID for SigV4 signing
        #
        # @param aws_secret_access_key [String, nil] AWS secret access key for SigV4 signing
        #
        # @param aws_session_token [String, nil] Optional AWS session token for temporary credentials
        #
        # @param aws_profile [String, nil] AWS profile name (uses SigV4 with named profile)
        #
        # @param aws_region [String, nil] AWS region for the base URL and SigV4 signing.
        #   Defaults to `ENV["AWS_REGION"]`, then `ENV["AWS_DEFAULT_REGION"]`. Required in SigV4 mode.
        #
        # @param skip_auth [Boolean] When true, skip all auth.
        #   Note: the base SDK may still send an X-Api-Key header if ANTHROPIC_API_KEY is set.
        #
        # @param base_url [String, nil] Override the default base URL for the API.
        #   Defaults to `ENV["ANTHROPIC_BEDROCK_MANTLE_BASE_URL"]`, then
        #   `https://bedrock-mantle.{region}.api.aws/anthropic`.
        #
        # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
        #
        # @param timeout [Float]
        #
        # @param initial_retry_delay [Float]
        #
        # @param max_retry_delay [Float]
        #
        def initialize(
          api_key: nil,
          aws_access_key: nil,
          aws_secret_access_key: nil,
          aws_session_token: nil,
          aws_profile: nil,
          aws_region: ENV["AWS_REGION"] || ENV["AWS_DEFAULT_REGION"],
          skip_auth: false,
          base_url: ENV["ANTHROPIC_BEDROCK_MANTLE_BASE_URL"],
          max_retries: self.class::DEFAULT_MAX_RETRIES,
          timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
          initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
          max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
        )
          effective_api_key, resolved_base_url = setup_aws_auth(
            api_key: api_key,
            aws_access_key: aws_access_key,
            aws_secret_access_key: aws_secret_access_key,
            aws_session_token: aws_session_token,
            aws_profile: aws_profile,
            aws_region: aws_region,
            skip_auth: skip_auth,
            base_url: base_url,
            service_name: "bedrock-mantle",
            env_api_key: "AWS_BEARER_TOKEN_BEDROCK",
            env_api_key_fallback: "ANTHROPIC_AWS_API_KEY",
            derive_base_url: ->(region) { "https://bedrock-mantle.#{region}.api.aws/anthropic" },
            use_bearer_auth: true
          )

          super(
            api_key: effective_api_key,
            base_url: resolved_base_url,
            max_retries: max_retries,
            timeout: timeout,
            initial_retry_delay: initial_retry_delay,
            max_retry_delay: max_retry_delay
          )

          # Only initialize supported resources
          @messages = Anthropic::Resources::Messages.new(client: self)
          @beta = MantleBeta.new(client: self)
        end

        # Completions are not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported.
        def completions
          raise NotImplementedError, "Completions are not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported."
        end

        # Models listing is not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported.
        def models
          raise NotImplementedError, "Models listing is not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported."
        end

        # @api private
        private def transform_request(request)
          aws_auth_transform_request(request)
        end

        # Restricted Beta service that only exposes messages. Other beta resources
        # (models, files, skills) are not supported on Bedrock Mantle.
        class MantleBeta
          # @return [Anthropic::Resources::Beta::Messages]
          attr_reader :messages

          # @api private
          def initialize(client:)
            @messages = Anthropic::Resources::Beta::Messages.new(client: client)
          end

          def models
            raise NotImplementedError, "Beta models are not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported."
          end

          def files
            raise NotImplementedError, "Beta files are not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported."
          end

          def skills
            raise NotImplementedError, "Beta skills are not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported."
          end
        end
      end
    end
  end
end
