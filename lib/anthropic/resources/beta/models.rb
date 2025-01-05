# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Models
        # @param client [Anthropic::Client]
        #
        def initialize(client:)
          @client = client
        end

        # Get a specific model.
        #
        #   The Models API response can be used to determine information about a specific
        #   model or resolve a model alias to a model ID.
        #
        # @param model_id [String] Model identifier or alias.
        #
        # @param opts [Hash{Symbol => Object}, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
        #
        # @return [Anthropic::Models::Beta::BetaModelInfo]
        #
        def retrieve(model_id, opts = {})
          req = {
            method: :get,
            path: ["v1/models/%0s?beta=true", model_id],
            model: Anthropic::Models::Beta::BetaModelInfo
          }
          @client.request(req, opts)
        end

        # List available models.
        #
        #   The Models API response can be used to determine which models are available for
        #   use in the API. More recently released models are listed first.
        #
        # @param params [Hash{Symbol => Object}, Anthropic::Models::Beta::ModelListParams] Attributes to send in this request.
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
        # @param opts [Hash{Symbol => Object}, Anthropic::RequestOptions] Options to specify HTTP behaviour for this request.
        #
        # @return [Anthropic::Page<Anthropic::Models::Beta::BetaModelInfo>]
        #
        def list(params = {}, opts = {})
          parsed = Anthropic::Models::Beta::ModelListParams.dump(params)
          req = {
            method: :get,
            path: "v1/models?beta=true",
            query: parsed,
            page: Anthropic::Page,
            model: Anthropic::Models::Beta::BetaModelInfo
          }
          @client.request(req, opts)
        end
      end
    end
  end
end
