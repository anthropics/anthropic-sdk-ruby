# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Models
        # Get a specific model.
        #
        # The Models API response can be used to determine information about a specific
        # model or resolve a model alias to a model ID.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::ModelRetrieveParams} for more details.
        #
        # @overload retrieve(model_id, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param model_id [String] Model identifier or alias.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaModelInfo]
        #
        # @see Anthropic::Models::Beta::ModelRetrieveParams
        def retrieve(model_id, params = {})
          parsed, options = Anthropic::Beta::ModelRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/models/%1$s?beta=true", model_id],
            headers: parsed.transform_keys(betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"),
            model: Anthropic::Beta::BetaModelInfo,
            options: options
          )
        end

        # List available models.
        #
        # The Models API response can be used to determine which models are available for
        # use in the API. More recently released models are listed first.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::ModelListParams} for more details.
        #
        # @overload list(after_id: nil, before_id: nil, limit: nil, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param after_id [String] Query param: ID of the object to use as a cursor for pagination. When provided,
        #
        # @param before_id [String] Query param: ID of the object to use as a cursor for pagination. When provided,
        #
        # @param limit [Integer] Query param: Number of items to return per page.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::Page<Anthropic::Models::Beta::BetaModelInfo>]
        #
        # @see Anthropic::Models::Beta::ModelListParams
        def list(params = {})
          query_params = [:after_id, :before_id, :limit]
          parsed, options = Anthropic::Beta::ModelListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: "v1/models?beta=true",
            query: query,
            headers: parsed.except(*query_params).transform_keys(
              betas: "anthropic-beta",
              workspace_id: "anthropic-workspace-id"
            ),
            page: Anthropic::Internal::Page,
            model: Anthropic::Beta::BetaModelInfo,
            options: options
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
