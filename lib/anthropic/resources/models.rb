# frozen_string_literal: true

module Anthropic
  module Resources
    class Models
      # Get a specific model.
      #
      #   The Models API response can be used to determine information about a specific
      #   model or resolve a model alias to a model ID.
      #
      # @param model_id [String] Model identifier or alias.
      #
      # @param params [Anthropic::Models::ModelRetrieveParams, Hash{Symbol=>Object}] .
      #
      #   @option params [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil] :request_options
      #
      # @return [Anthropic::Models::ModelInfo]
      def retrieve(model_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/models/%1$s", model_id],
          model: Anthropic::Models::ModelInfo,
          options: params[:request_options]
        )
      end

      # List available models.
      #
      #   The Models API response can be used to determine which models are available for
      #   use in the API. More recently released models are listed first.
      #
      # @param params [Anthropic::Models::ModelListParams, Hash{Symbol=>Object}] .
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
      # @return [Anthropic::Page<Anthropic::Models::ModelInfo>]
      def list(params = {})
        parsed, options = Anthropic::Models::ModelListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/models",
          query: parsed,
          page: Anthropic::Page,
          model: Anthropic::Models::ModelInfo,
          options: options
        )
      end

      # @param client [Anthropic::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
