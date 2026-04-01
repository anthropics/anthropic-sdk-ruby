# frozen_string_literal: true

module Anthropic
  module Helpers
    module AWS
      class Client < Anthropic::Client
        include Anthropic::Helpers::AWSAuth

        # @return [String, nil]
        attr_reader :aws_region

        # @return [String, nil]
        attr_reader :workspace_id

        # Creates and returns a new client for interacting with Anthropic models via the AWS gateway.
        #
        # AWS credentials are resolved in priority order:
        #   1. `api_key` constructor arg → API key mode (x-api-key header, no SigV4)
        #   2. `aws_access_key` + `aws_secret_access_key` args → SigV4 with explicit credentials
        #   3. `aws_profile` arg → SigV4 with named AWS profile
        #   4. `ANTHROPIC_AWS_API_KEY` env var → API key mode (only when no platform auth args given)
        #   5. Default AWS credential chain (env vars → shared config → instance profile) → SigV4
        #
        # When `skip_auth` is true, all auth is skipped and workspace_id is not required.
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
        # @param aws_region [String, nil] AWS region for the gateway URL and SigV4 signing.
        #   Defaults to `ENV["AWS_REGION"]`, then `ENV["AWS_DEFAULT_REGION"]`. Required in SigV4 mode.
        #
        # @param workspace_id [String, nil] Anthropic workspace ID, sent as `anthropic-workspace-id` header.
        #   Defaults to `ENV["ANTHROPIC_AWS_WORKSPACE_ID"]`
        #
        # @param skip_auth [Boolean] When true, skip all auth (no SigV4, no API key) and do not
        #   require workspace_id. Useful for testing or when auth is handled externally.
        #
        # @param base_url [String, nil] Override the default base URL for the API.
        #   Defaults to `ENV["ANTHROPIC_AWS_BASE_URL"]`, then `https://aws-external-anthropic.{region}.api.aws`.
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
          workspace_id: ENV["ANTHROPIC_AWS_WORKSPACE_ID"],
          skip_auth: false,
          base_url: ENV["ANTHROPIC_AWS_BASE_URL"],
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
            workspace_id: workspace_id,
            skip_auth: skip_auth,
            base_url: base_url,
            service_name: "aws-external-anthropic",
            env_api_key: "ANTHROPIC_AWS_API_KEY",
            env_workspace_id: "ANTHROPIC_AWS_WORKSPACE_ID",
            derive_base_url: ->(region) { "https://aws-external-anthropic.#{region}.api.aws" }
          )

          super(
            api_key: effective_api_key,
            base_url: resolved_base_url,
            max_retries: max_retries,
            timeout: timeout,
            initial_retry_delay: initial_retry_delay,
            max_retry_delay: max_retry_delay
          )
        end

        # @api private
        private def transform_request(request)
          aws_auth_transform_request(request)
        end
      end
    end
  end
end
