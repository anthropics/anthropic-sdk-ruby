# frozen_string_literal: true

module Anthropic
  module Helpers
    module Bedrock
      class Client < Anthropic::Client
        DEFAULT_VERSION = "bedrock-2023-05-31"

        # @return [Anthropic::Resources::Messages]
        attr_reader :messages

        # @return [Anthropic::Resources::Completions]
        attr_reader :completions

        # @return [Anthropic::Resources::Beta]
        attr_reader :beta

        # @return [String]
        attr_reader :aws_region

        # @return [Aws::Credentials]
        attr_reader :aws_credentials

        # Creates and returns a new client for interacting with the AWS Bedrock API for Anthropic models.
        #
        # AWS credentials are resolved according to the AWS SDK's default resolution order, described at
        #   https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/setup-config.html#credchain or https://github.com/aws/aws-sdk-ruby?tab=readme-ov-file#configuration
        #
        # @param aws_region [String, nil] Enforce the AWS Region to use. If unset, the region is set according to the
        #   AWS SDK's default resolution order, described at https://github.com/aws/aws-sdk-ruby?tab=readme-ov-file#configuration
        #
        # @param aws_access_key [String, nil]  Optional AWS access key to use for authentication. Overrides profile and credential provider chain
        #
        # @param aws_secret_key [String, nil] Optional AWS secret access key to use for authentication. Overrides profile and credential provider chain
        #
        # @param aws_session_token [String, nil] Optional AWS session token to use for authentication. Overrides profile and credential provider chain
        #
        # @param aws_profile [String, nil] Optional AWS profile to use for authentication. Overrides the credential provider chain
        #
        # @param base_url [String, nil] Override the default base URL for the API, e.g., `"https://api.example.com/v2/"`
        #
        # @param max_retries [Integer] The maximum number of times to retry a request if it fails
        #
        # @param timeout [Float] The number of seconds to wait for a response before timing out
        #
        # @param initial_retry_delay [Float] The number of seconds to wait before retrying a request
        #
        # @param max_retry_delay [Float] The maximum number of seconds to wait before retrying a request
        #
        def initialize(
          aws_region: nil,
          base_url: nil,
          max_retries: DEFAULT_MAX_RETRIES,
          timeout: DEFAULT_TIMEOUT_IN_SECONDS,
          initial_retry_delay: DEFAULT_INITIAL_RETRY_DELAY,
          max_retry_delay: DEFAULT_MAX_RETRY_DELAY,
          aws_access_key: nil,
          aws_secret_key: nil,
          aws_session_token: nil,
          aws_profile: nil
        )
          begin
            require("aws-sdk-bedrockruntime")
          rescue LoadError
            message = <<~MSG

              In order to access Anthropic models on Bedrock you must require the `aws-sdk-bedrockruntime` gem.
              You can install it by adding the following to your Gemfile:

                  gem "aws-sdk-bedrockruntime"

              and then running `bundle install`.

              Alternatively, if you are not using Bundler, simply run:

                  gem install aws-sdk-bedrockruntime
            MSG

            raise RuntimeError.new(message)
          end

          @aws_region, @aws_credentials = resolve_region_and_credentials(
            aws_region: aws_region,
            aws_secret_key: aws_secret_key,
            aws_access_key: aws_access_key,
            aws_session_token: aws_session_token,
            aws_profile: aws_profile
          )

          @signer = Aws::Sigv4::Signer.new(
            service: "bedrock",
            region: @aws_region,
            credentials: @aws_credentials
          )

          base_url ||= ENV.fetch(
            "ANTHROPIC_BEDROCK_BASE_URL",
            "https://bedrock-runtime.#{@aws_region}.amazonaws.com"
          )

          super(
            base_url: base_url,
            timeout: timeout,
            max_retries: max_retries,
            initial_retry_delay: initial_retry_delay,
            max_retry_delay: max_retry_delay,
          )

          @messages = Anthropic::Resources::Messages.new(client: self)
          @completions = Anthropic::Resources::Completions.new(client: self)
          @beta = Anthropic::Resources::Beta.new(client: self)
        end

        # @api private
        #
        # @param req [Hash{Symbol=>Object}] .
        #
        #   @option req [Symbol] :method
        #
        #   @option req [String, Array<String>] :path
        #
        #   @option req [Hash{String=>Array<String>, String, nil}, nil] :query
        #
        #   @option req [Hash{String=>String, Integer, Array<String, Integer, nil>, nil}, nil] :headers
        #
        #   @option req [Object, nil] :body
        #
        #   @option req [Symbol, Integer, Array<Symbol, Integer>, Proc, nil] :unwrap
        #
        #   @option req [Class<Anthropic::Internal::Type::BasePage>, nil] :page
        #
        #   @option req [Class<Anthropic::Internal::Type::BaseStream>, nil] :stream
        #
        #   @option req [Anthropic::Internal::Type::Converter, Class, nil] :model
        #
        # @param opts [Hash{Symbol=>Object}] .
        #
        #   @option opts [String, nil] :idempotency_key
        #
        #   @option opts [Hash{String=>Array<String>, String, nil}, nil] :extra_query
        #
        #   @option opts [Hash{String=>String, nil}, nil] :extra_headers
        #
        #   @option opts [Object, nil] :extra_body
        #
        #   @option opts [Integer, nil] :max_retries
        #
        #   @option opts [Float, nil] :timeout
        #
        # @return [Hash{Symbol=>Object}]
        private def build_request(req, opts)
          fit_req_to_bedrock_specs!(req)

          request_input = super

          signed_request = @signer.sign_request(
            http_method: request_input[:method],
            url: request_input[:url],
            headers: request_input[:headers],
            body: request_input[:body]
          )

          request_input[:headers].merge!(signed_request.headers)

          request_input
        end

        # @param aws_region [String, nil]
        #
        # @param aws_secret_key [String, nil]
        #
        # @param aws_access_key [String, nil]
        #
        # @param aws_session_token [String, nil]
        #
        # @param aws_profile [String, nil]
        #
        # @return [Array<String, Aws::Credentials>]
        #
        private def resolve_region_and_credentials(
          aws_region:,
          aws_secret_key:,
          aws_access_key:,
          aws_session_token:,
          aws_profile:
        )
          client_options = {
            access_key_id: aws_access_key,
            secret_access_key: aws_secret_key,
            session_token: aws_session_token,
            profile: aws_profile
          }
          (client_options[:region] = aws_region) unless aws_region.nil?

          bedrock_client = Aws::BedrockRuntime::Client.new(client_options)
          [bedrock_client.config.region, bedrock_client.config.credentials.credentials]
        end

        # @private
        #
        # Overrides request components for Bedrock-specific request-shape requirements.
        #
        # @param request_components [Hash{Symbol=>Object}] .
        #
        #   @option request_components [Symbol] :method
        #
        #   @option request_components [String, Array<String>] :path
        #
        #   @option request_components [Hash{String=>Array<String>, String, nil}, nil] :query
        #
        #   @option request_components [Hash{String=>String, nil}, nil] :headers
        #
        #   @option request_components [Object, nil] :body
        #
        #   @option request_components [Symbol, nil] :unwrap
        #
        #   @option request_components [Class, nil] :page
        #
        #   @option request_components [Anthropic::Converter, Class, nil] :model
        #
        # @return [Hash{Symbol=>Object}]
        #
        private def fit_req_to_bedrock_specs!(request_components)
          if (body = request_components[:body]).is_a?(Hash)
            body[:anthropic_version] ||= DEFAULT_VERSION
            body.transform_keys!("anthropic-beta": :anthropic_beta)
          end

          case request_components[:path]
          in %r{^v1/messages/batches}
            message = "The Batch API is not supported in Bedrock yet"
            raise NotImplementedError.new(message)
          in %r{v1/messages/count_tokens}
            message = "Token counting is not supported in Bedrock yet"
            raise NotImplementedError.new(message)
          in %r{v1/models\?beta=true}
            # rubocop:disable Layout/LineLength
            message = "Please instead use https://docs.anthropic.com/en/api/claude-on-amazon-bedrock#list-available-models to list available models on Bedrock."
            # rubocop:enable Layout/LineLength
            raise NotImplementedError.new(message)
          else
          end

          if %w[
            v1/complete
            v1/messages
            v1/messages?beta=true
          ].include?(request_components[:path]) && request_components[:method] == :post && body.is_a?(Hash)
            model = body.delete(:model)
            model = URI.encode_www_form_component(model.to_s)
            stream = body.delete(:stream) || false
            request_components[:path] =
              stream ? "model/#{model}/invoke-with-response-stream" : "model/#{model}/invoke"
          end

          request_components
        end
      end
    end
  end
end
