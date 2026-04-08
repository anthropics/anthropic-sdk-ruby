# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Environments
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::EnvironmentCreateParams} for more details.
        #
        # Create a new environment with the specified configuration.
        #
        # @overload create(name:, config: nil, description: nil, metadata: nil, betas: nil, request_options: {})
        #
        # @param name [String] Body param: Human-readable name for the environment
        #
        # @param config [Anthropic::Models::Beta::BetaCloudConfigParams, nil] Body param: Request params for `cloud` environment configuration.
        #
        # @param description [String, nil] Body param: Optional description of the environment
        #
        # @param metadata [Hash{Symbol=>String}] Body param: User-provided metadata key-value pairs
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaEnvironment]
        #
        # @see Anthropic::Models::Beta::EnvironmentCreateParams
        def create(params)
          parsed, options = Anthropic::Beta::EnvironmentCreateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/environments?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaEnvironment,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Retrieve a specific environment by ID.
        #
        # @overload retrieve(environment_id, betas: nil, request_options: {})
        #
        # @param environment_id [String]
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaEnvironment]
        #
        # @see Anthropic::Models::Beta::EnvironmentRetrieveParams
        def retrieve(environment_id, params = {})
          parsed, options = Anthropic::Beta::EnvironmentRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/environments/%1$s?beta=true", environment_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaEnvironment,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::EnvironmentUpdateParams} for more details.
        #
        # Update an existing environment's configuration.
        #
        # @overload update(environment_id, config: nil, description: nil, metadata: nil, name: nil, betas: nil, request_options: {})
        #
        # @param environment_id [String] Path param
        #
        # @param config [Anthropic::Models::Beta::BetaCloudConfigParams, nil] Body param: Request params for `cloud` environment configuration.
        #
        # @param description [String, nil] Body param: Updated description of the environment
        #
        # @param metadata [Hash{Symbol=>String, nil}] Body param: User-provided metadata key-value pairs. Set a value to null or empty
        #
        # @param name [String, nil] Body param: Updated name for the environment
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaEnvironment]
        #
        # @see Anthropic::Models::Beta::EnvironmentUpdateParams
        def update(environment_id, params = {})
          parsed, options = Anthropic::Beta::EnvironmentUpdateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: ["v1/environments/%1$s?beta=true", environment_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaEnvironment,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::EnvironmentListParams} for more details.
        #
        # List environments with pagination support.
        #
        # @overload list(include_archived: nil, limit: nil, page: nil, betas: nil, request_options: {})
        #
        # @param include_archived [Boolean] Query param: Include archived environments in the response
        #
        # @param limit [Integer] Query param: Maximum number of environments to return
        #
        # @param page [String, nil] Query param: Opaque cursor from previous response for pagination. Pass the `next
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::BetaEnvironment>]
        #
        # @see Anthropic::Models::Beta::EnvironmentListParams
        def list(params = {})
          query_params = [:include_archived, :limit, :page]
          parsed, options = Anthropic::Beta::EnvironmentListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: "v1/environments?beta=true",
            query: query,
            headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Beta::BetaEnvironment,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Delete an environment by ID. Returns a confirmation of the deletion.
        #
        # @overload delete(environment_id, betas: nil, request_options: {})
        #
        # @param environment_id [String]
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaEnvironmentDeleteResponse]
        #
        # @see Anthropic::Models::Beta::EnvironmentDeleteParams
        def delete(environment_id, params = {})
          parsed, options = Anthropic::Beta::EnvironmentDeleteParams.dump_request(params)
          @client.request(
            method: :delete,
            path: ["v1/environments/%1$s?beta=true", environment_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaEnvironmentDeleteResponse,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Archive an environment by ID. Archived environments cannot be used to create new
        # sessions.
        #
        # @overload archive(environment_id, betas: nil, request_options: {})
        #
        # @param environment_id [String]
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaEnvironment]
        #
        # @see Anthropic::Models::Beta::EnvironmentArchiveParams
        def archive(environment_id, params = {})
          parsed, options = Anthropic::Beta::EnvironmentArchiveParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/environments/%1$s/archive?beta=true", environment_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaEnvironment,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
