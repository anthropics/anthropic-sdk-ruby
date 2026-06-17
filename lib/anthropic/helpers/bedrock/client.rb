# frozen_string_literal: true

module Anthropic
  module Helpers
    module Bedrock
      class Client < Anthropic::Client
        include Anthropic::Helpers::AWSAuth

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

        # @return [String, nil]
        def api_key = @auth_token

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
        # @param api_key [String, nil] Optional API key for Bearer token authentication. Mutually exclusive with AWS
        #   credentials. Falls back to the `AWS_BEARER_TOKEN_BEDROCK` environment variable if not provided.
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
        # @param middleware [Array<#call>, #call, nil] Per-attempt HTTP around-middleware. See
        #   {Anthropic::Middleware}. Middleware sees the canonical Anthropic request shape;
        #   the Bedrock URL rewrite and SigV4 signing happen inside the continuation, per
        #   attempt.
        #
        def initialize( # rubocop:disable Lint/MissingSuper
          aws_region: nil,
          base_url: nil,
          max_retries: self.class::DEFAULT_MAX_RETRIES,
          timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
          initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
          max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY,
          aws_access_key: nil,
          aws_secret_key: nil,
          aws_session_token: nil,
          aws_profile: nil,
          api_key: nil,
          middleware: nil
        )
          api_key ||= ENV["AWS_BEARER_TOKEN_BEDROCK"]

          has_aws_credentials = !aws_access_key.nil? || !aws_secret_key.nil? || !aws_session_token.nil? || !aws_profile.nil?
          if !api_key.nil? && has_aws_credentials
            raise ArgumentError.new(
              "Cannot specify both `api_key` and AWS credentials (`aws_access_key`, `aws_secret_key`, `aws_session_token`, `aws_profile`)"
            )
          end

          if api_key.nil?
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
          else
            @aws_region = aws_region
          end

          base_url ||= ENV.fetch(
            "ANTHROPIC_BEDROCK_BASE_URL",
            "https://bedrock-runtime.#{@aws_region}.amazonaws.com"
          )

          @api_key = nil
          @auth_token = @signer ? nil : api_key
          @credentials = nil
          @token_cache = nil
          # For AWSAuth#auth_headers: suppress key headers in SigV4 mode; in
          # API-key mode fall through to the base bearer-token handling.
          @use_sig_v4 = !@signer.nil?
          @use_bearer_auth = false

          # Skip Anthropic::Client#initialize and bind BaseClient#initialize directly:
          # the parent's initializer runs OIDC/credential-provider resolution that does
          # not apply here.
          Anthropic::Internal::Transport::BaseClient.instance_method(:initialize).bind(self).call(
            base_url: base_url,
            timeout: timeout,
            max_retries: max_retries,
            initial_retry_delay: initial_retry_delay,
            max_retry_delay: max_retry_delay,
            headers: {"anthropic-version" => "2023-06-01"},
            middleware: middleware
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
          validate_bedrock_request!(req)
          super
        end

        # @api private
        #
        # The Bedrock provider middleware: rewrites the canonical request into
        # Bedrock's shape and SigV4-signs it. Appended innermost on every
        # dispatch (below user middleware) and runs per attempt, so each retry
        # or middleware-re-issued leg is re-adapted and re-signed for its own
        # model and URL.
        #
        # @return [#call]
        private def provider_middleware
          lambda do |req, nxt|
            req = adapt_request(req)
            # `follow_redirect` stripped `authorization` for a cross-origin
            # hop — don't re-sign and leak credentials to the new origin.
            req = sign_aws_request(req) if @signer && !req.metadata[:cross_origin_redirect]
            res = nxt.call(req)
            # `invoke-with-response-stream` returns AWS event-stream framing,
            # not SSE — transcode so `Util.decode_sse` and the streaming
            # helpers work unchanged.
            res = adapt_stream_response(res) if EventStream::AWS_CONTENT_TYPE.match?(res.headers["content-type"].to_s)
            res
          end
        end

        # @api private
        #
        # Rebuilds the response with the body transcoded from AWS event-stream
        # framing to SSE bytes and the `content-type` rewritten so
        # {Anthropic::Internal::Util.decode_content} dispatches to `decode_sse`.
        #
        # @param res [Anthropic::APIResponse]
        # @return [Anthropic::APIResponse]
        private def adapt_stream_response(res)
          Anthropic::APIResponse.new(
            status: res.status,
            headers: res.headers.merge("content-type" => "text/event-stream"),
            body: EventStream.to_sse(res.body),
            raw: res.raw,
            streaming: true,
            request: res.request
          )
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
        # Fail fast at request-build time on routes Bedrock does not support.
        #
        # @param request_components [Hash{Symbol=>Object}]
        # @return [void]
        private def validate_bedrock_request!(request_components)
          # Id-parameterized routes pass `path` as an Array whose first element
          # is the format string (e.g. `["v1/messages/batches/%1$s", id]`).
          case Array(request_components[:path]).first.to_s
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
        end

        # @api private
        #
        # Rewrites the canonical Anthropic request into Bedrock's shape — drops
        # `:model`/`:stream` from the body and retargets the URL to
        # `/model/{model}/invoke[-with-response-stream]`. Called from
        # {#provider_middleware}, so user middleware sees the canonical
        # request. Pure: the incoming request, its body, and its URI are never
        # mutated (they are reused across retry attempts).
        #
        # @param req [Anthropic::APIRequest]
        # @return [Anthropic::APIRequest]
        private def adapt_request(req)
          body = req.body
          return req unless body.is_a?(Hash)

          body = body.transform_keys("anthropic-beta": :anthropic_beta)
          body[:anthropic_version] ||= DEFAULT_VERSION

          path = req.url.path.to_s
          query = req.url.query
          messages_route =
            (path.end_with?("/v1/messages") && (query.nil? || query == "beta=true")) ||
            (path.end_with?("/v1/complete") && query.nil?)

          return req.with(body: body) unless req.method == :post && messages_route

          model = URI.encode_www_form_component(body.delete(:model).to_s)
          stream = body.delete(:stream) || false

          url = req.url.dup
          url.path = path.sub(
            %r{v1/(?:messages|complete)\z},
            stream ? "model/#{model}/invoke-with-response-stream" : "model/#{model}/invoke"
          )
          url.query = nil

          req.with(body: body, url: url)
        end
      end
    end
  end
end
