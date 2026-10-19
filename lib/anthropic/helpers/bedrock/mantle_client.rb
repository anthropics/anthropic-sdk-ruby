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
        # @param timeout [Float, nil] Request timeout in seconds. Defaults to
        #   `Anthropic::Client::DEFAULT_TIMEOUT_IN_SECONDS` when `nil`.
        #
        # @param initial_retry_delay [Float]
        #
        # @param max_retry_delay [Float]
        #
        # @param open_telemetry [Hash{Symbol=>Object}, Boolean, nil] OpenTelemetry tracing of this
        #   client's API calls. See {Anthropic::Client#initialize}.
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
          timeout: nil,
          initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
          max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY,
          open_telemetry: nil
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
            max_retry_delay: max_retry_delay,
            open_telemetry: open_telemetry
          )

          # Only initialize supported resources
          @messages = Anthropic::Resources::Messages.new(client: self)
          @beta = MantleBeta.new(client: self)
        end

        # Completions are not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported.
        def completions
          raise NotImplementedError,
                "Completions are not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported."
        end

        # Models listing is not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported.
        def models
          raise NotImplementedError,
                "Models listing is not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported."
        end

        # Files are not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported.
        def files
          raise NotImplementedError,
                "Files are not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported."
        end

        # Skills are not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported.
        def skills
          raise NotImplementedError,
                "Skills are not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported."
        end

        # User profiles are not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported.
        def user_profiles
          raise NotImplementedError,
                "User profiles are not supported on Bedrock Mantle. " \
                "Only Messages (/v1/messages) is supported."
        end

        # @api private
        #
        # @return [Hash{String=>String}]
        def open_telemetry_attributes
          {**super, Anthropic::Internal::Tracing::GEN_AI_PROVIDER_NAME => "aws.bedrock"}
        end

        # @api private
        #
        # @return [String]
        private def open_telemetry_scope = "#{super}.bedrock"

        # @api private
        #
        # @return [#call]
        private def provider_middleware
          ->(req, nxt) { aws_auth_provider(adapt_request(req), nxt) }
        end

        # @api private
        #
        # Mantle drops custom request headers, so Messages and token counting send the user profile ID
        # in the body.
        #
        # @param req [Anthropic::APIRequest]
        # @return [Anthropic::APIRequest]
        private def adapt_request(req)
          path = req.url.path.to_s
          return req unless req.method == :post && path.end_with?("/v1/messages", "/v1/messages/count_tokens")

          body = req.body
          profile_headers, headers = req.headers.partition do |name, _|
            name.to_s.casecmp?("anthropic-user-profile-id")
          end
          user_profile_id = profile_headers.last&.last
          return req if user_profile_id.to_s.empty? || !body.is_a?(Hash)

          unless body.keys.any? { _1.to_s == "user_profile_id" }
            body = {**body, user_profile_id: user_profile_id}
          end
          req.with(headers: headers.to_h, body: body)
        end

        # Restricted Beta service that only exposes messages. Other beta resources
        # (models, files, skills, user profiles) are not supported on Bedrock Mantle.
        class MantleBeta
          # @return [Anthropic::Resources::Beta::Messages]
          attr_reader :messages

          # @api private
          def initialize(client:)
            @messages = Anthropic::Resources::Beta::Messages.new(client: client)
          end

          def models
            raise NotImplementedError,
                  "Beta models are not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported."
          end

          def files
            raise NotImplementedError,
                  "Beta files are not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported."
          end

          def skills
            raise NotImplementedError,
                  "Beta skills are not supported on Bedrock Mantle. Only Messages (/v1/messages) is supported."
          end

          def user_profiles
            raise NotImplementedError,
                  "Beta user profiles are not supported on Bedrock Mantle. " \
                  "Only Messages (/v1/messages) is supported."
          end
        end
      end
    end
  end
end
