# frozen_string_literal: true

module Anthropic
  module Resources
    class Models
      # Get a specific model.
      #
      # The Models API response can be used to determine information about a specific
      # model or resolve a model alias to a model ID.
      #
      # @overload retrieve(model_id, request_options: {})
      #
      # @param model_id [String]
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::ModelInfo]
      #
      # @see Anthropic::Models::ModelRetrieveParams
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
      # The Models API response can be used to determine which models are available for
      # use in the API. More recently released models are listed first.
      #
      # @overload list(after_id: nil, before_id: nil, limit: nil, request_options: {})
      #
      # @param after_id [String]
      # @param before_id [String]
      # @param limit [Integer]
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Internal::Page<Anthropic::Models::ModelInfo>]
      #
      # @see Anthropic::Models::ModelListParams
      def list(params = {})
        parsed, options = Anthropic::Models::ModelListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "v1/models",
          query: parsed,
          page: Anthropic::Internal::Page,
          model: Anthropic::Models::ModelInfo,
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
