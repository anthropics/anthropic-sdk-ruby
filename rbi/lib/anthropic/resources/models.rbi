# typed: strong

module Anthropic
  module Resources
    class Models
      # Get a specific model.
      #
      #   The Models API response can be used to determine information about a specific
      #   model or resolve a model alias to a model ID.
      sig do
        params(
          model_id: String,
          request_options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Anthropic::Models::ModelInfo)
      end
      def retrieve(model_id, request_options: {})
      end

      # List available models.
      #
      #   The Models API response can be used to determine which models are available for
      #   use in the API. More recently released models are listed first.
      sig do
        params(
          after_id: String,
          before_id: String,
          limit: Integer,
          request_options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Anthropic::Page[Anthropic::Models::ModelInfo])
      end
      def list(after_id: nil, before_id: nil, limit: nil, request_options: {})
      end

      sig { params(client: Anthropic::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
