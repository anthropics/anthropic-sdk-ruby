# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Models
        # Get a specific model.
        #
        #   The Models API response can be used to determine information about a specific
        #   model or resolve a model alias to a model ID.
        #
        # @param model_id [String] Model identifier or alias.
        #
        # @param params [Anthropic::Models::Beta::ModelRetrieveParams, Hash{Symbol=>Object}] .
        #
        #   @option params [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
        #
        # @return [Anthropic::Models::Beta::BetaModelInfo]
        #
        # @see Anthropic::Models::Beta::ModelRetrieveParams
        def retrieve(model_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/models/%1$s?beta=true", model_id],
            model: Anthropic::Models::Beta::BetaModelInfo,
            options: params[:request_options]
          )
        end

        # List available models.
        #
        #   The Models API response can be used to determine which models are available for
        #   use in the API. More recently released models are listed first.
        #
        # @param params [Anthropic::Models::Beta::ModelListParams, Hash{Symbol=>Object}] .
        #
        #   @option params [String] :after_id ID of the object to use as a cursor for pagination. When provided, returns the
        #     page of results immediately after this object.
        #
        #   @option params [String] :before_id ID of the object to use as a cursor for pagination. When provided, returns the
        #     page of results immediately before this object.
        #
        #   @option params [Integer] :limit Number of items to return per page.
        #
        #     Defaults to `20`. Ranges from `1` to `1000`.
        #
        #   @option params [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
        #
        # @return [Anthropic::Page<Anthropic::Models::Beta::BetaModelInfo>]
        #
        # @see Anthropic::Models::Beta::ModelListParams
        def list(params = {})
          parsed, options = Anthropic::Models::Beta::ModelListParams.dump_request(params)
          @client.request(
            method: :get,
            path: "v1/models?beta=true",
            query: parsed,
            page: Anthropic::Page,
            model: Anthropic::Models::Beta::BetaModelInfo,
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
