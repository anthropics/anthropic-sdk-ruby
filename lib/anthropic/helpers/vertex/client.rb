# frozen_string_literal: true

module Anthropic
  module Helpers
    module Vertex
      class Client < Anthropic::Client
        DEFAULT_VERSION = "vertex-2023-10-16"

        # @return [String]
        attr_reader :region

        # @return [String]
        attr_reader :project_id

        # @return [Anthropic::Resources::Messages]
        attr_reader :messages

        # @return [Anthropic::Resources::Beta]
        attr_reader :beta

        # Creates and returns a new client for interacting with the GCP Vertex API for Anthropic models.
        #
        # GCP credentials are resolved according to Application Default Credentials, described at
        #   https://cloud.google.com/docs/authentication/provide-credentials-adc
        #
        # @param region [String, nil] Enforce the GCP Region to use. If unset, the region may be set with the CLOUD_ML_REGION environment variable.
        #
        # @param project_id [String, nil] Enforce the GCP Project ID to use. If unset, the project_id may be set with the ANTHROPIC_VERTEX_PROJECT_ID environment variable.
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
          region: ENV["CLOUD_ML_REGION"],
          project_id: ENV["ANTHROPIC_VERTEX_PROJECT_ID"],
          base_url: nil,
          max_retries: DEFAULT_MAX_RETRIES,
          timeout: DEFAULT_TIMEOUT_IN_SECONDS,
          initial_retry_delay: DEFAULT_INITIAL_RETRY_DELAY,
          max_retry_delay: DEFAULT_MAX_RETRY_DELAY
        )
          begin
            require("googleauth")
          rescue LoadError
            message = <<~MSG

              In order to access Anthropic models on Vertex you must require the `googleauth` gem.
              You can install it by adding the following to your Gemfile:

                  gem "googleauth"

              and then running `bundle install`.

              Alternatively, if you are not using Bundler, simply run:

                  gem install googleauth
            MSG

            raise RuntimeError.new(message)
          end

          if region.to_s.empty?
            # rubocop:disable Layout/LineLength
            message = "No region was given. The client should be instantiated with the `region` argument or the `CLOUD_ML_REGION` environment variable should be set."
            # rubocop:enable Layout/LineLength
            raise ArgumentError.new(message)
          end
          @region = region

          if project_id.to_s.empty?
            # rubocop:disable Layout/LineLength
            message = "No project_id was given and it could not be resolved from credentials. The client should be instantiated with the `project_id` argument or the `ANTHROPIC_VERTEX_PROJECT_ID` environment variable should be set."
            # rubocop:enable Layout/LineLength
            raise ArgumentError.new(message)
          end
          @project_id = project_id

          base_url ||= ENV.fetch("ANTHROPIC_VERTEX_BASE_URL", "https://#{@region}-aiplatform.googleapis.com/v1")

          super(
            base_url: base_url,
            timeout: timeout,
            max_retries: max_retries,
            initial_retry_delay: initial_retry_delay,
            max_retry_delay: max_retry_delay,
          )

          @messages = Anthropic::Resources::Messages.new(client: self)
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
          fit_req_to_vertex_specs!(req)

          request_input = super

          headers = request_input.fetch(:headers)

          unless headers.key?("authorization")
            authorization = Google::Auth.get_application_default(["https://www.googleapis.com/auth/cloud-platform"])
            request_input.store(:headers, authorization.apply(headers))
          end

          request_input
        end

        # @private
        #
        # Overrides request components for Vertex-specific request-shape requirements.
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
        private def fit_req_to_vertex_specs!(request_components)
          if (body = request_components[:body]).is_a?(Hash)
            body[:anthropic_version] ||= DEFAULT_VERSION

            if (anthropic_beta = body.delete(:"anthropic-beta"))
              request_components[:headers] ||= {}
              request_components[:headers]["anthropic-beta"] = anthropic_beta.join(",")
            end
          end

          if %w[
            v1/messages
            v1/messages?beta=true
          ].include?(request_components[:path]) && request_components[:method] == :post

            unless body.is_a?(Hash)
              raise ArgumentError.new("Expected json data to be a hash for post /v1/messages")
            end

            model = body.delete(:model)
            specifier = body[:stream] ? "streamRawPredict" : "rawPredict"

            request_components[:path] =
              "projects/#{@project_id}/locations/#{region}/publishers/anthropic/models/#{model}:#{specifier}"

          end

          if %w[
            v1/messages/count_tokens
            v1/messages/count_tokens?beta=true
          ].include?(request_components[:path]) &&
             request_components[:method] == :post
            request_components[:path] =
              "projects/#{@project_id}/locations/#{region}/publishers/anthropic/models/count-tokens:rawPredict"

          end

          if request_components[:path].start_with?("v1/messages/batches/")
            raise AnthropicError("The Batch API is not supported in the Vertex client yet")
          end

          request_components
        end
      end
    end
  end
end
