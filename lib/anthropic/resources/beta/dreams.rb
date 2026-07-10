# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Dreams
        # Create a Dream
        #
        # @overload create(inputs:, model:, instructions: nil, betas: nil, request_options: {})
        #
        # @param inputs [Array<Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput>] Body param
        #
        # @param model [String, Anthropic::Models::Beta::BetaDreamModelConfigParam] Body param: Model identifier and configuration applied to every pipeline stage.
        #
        # @param instructions [String, nil] Body param
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaDream]
        #
        # @see Anthropic::Models::Beta::DreamCreateParams
        def create(params)
          parsed, options = Anthropic::Beta::DreamCreateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/dreams?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaDream,
            options: {extra_headers: {"anthropic-beta" => "dreaming-2026-04-21"}, **options}
          )
        end

        # Get a Dream
        #
        # @overload retrieve(dream_id, betas: nil, request_options: {})
        #
        # @param dream_id [String] Path parameter dream_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaDream]
        #
        # @see Anthropic::Models::Beta::DreamRetrieveParams
        def retrieve(dream_id, params = {})
          parsed, options = Anthropic::Beta::DreamRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/dreams/%1$s?beta=true", dream_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaDream,
            options: {extra_headers: {"anthropic-beta" => "dreaming-2026-04-21"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::DreamListParams} for more details.
        #
        # List Dreams
        #
        # @overload list(created_at_gt: nil, created_at_lt: nil, include_archived: nil, limit: nil, page: nil, statuses: nil, betas: nil, request_options: {})
        #
        # @param created_at_gt [Time] Query param: Return dreams with `created_at` strictly after this timestamp (excl
        #
        # @param created_at_lt [Time] Query param: Return dreams with `created_at` strictly before this timestamp (exc
        #
        # @param include_archived [Boolean] Query param: Query parameter for include_archived
        #
        # @param limit [Integer] Query param: Query parameter for limit
        #
        # @param page [String] Query param: Query parameter for page
        #
        # @param statuses [Array<Symbol, Anthropic::Models::Beta::BetaDreamStatus>] Query param: Filter by lifecycle status. Repeat the parameter to match any of mu
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::BetaDream>]
        #
        # @see Anthropic::Models::Beta::DreamListParams
        def list(params = {})
          query_params = [:created_at_gt, :created_at_lt, :include_archived, :limit, :page, :statuses]
          parsed, options = Anthropic::Beta::DreamListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: "v1/dreams?beta=true",
            query: query.transform_keys(created_at_gt: "created_at[gt]", created_at_lt: "created_at[lt]"),
            headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Beta::BetaDream,
            options: {extra_headers: {"anthropic-beta" => "dreaming-2026-04-21"}, **options}
          )
        end

        # Archive a Dream
        #
        # @overload archive(dream_id, betas: nil, request_options: {})
        #
        # @param dream_id [String] Path parameter dream_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaDream]
        #
        # @see Anthropic::Models::Beta::DreamArchiveParams
        def archive(dream_id, params = {})
          parsed, options = Anthropic::Beta::DreamArchiveParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/dreams/%1$s/archive?beta=true", dream_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaDream,
            options: {extra_headers: {"anthropic-beta" => "dreaming-2026-04-21"}, **options}
          )
        end

        # Cancel a Dream
        #
        # @overload cancel(dream_id, betas: nil, request_options: {})
        #
        # @param dream_id [String] Path parameter dream_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaDream]
        #
        # @see Anthropic::Models::Beta::DreamCancelParams
        def cancel(dream_id, params = {})
          parsed, options = Anthropic::Beta::DreamCancelParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/dreams/%1$s/cancel?beta=true", dream_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaDream,
            options: {extra_headers: {"anthropic-beta" => "dreaming-2026-04-21"}, **options}
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
