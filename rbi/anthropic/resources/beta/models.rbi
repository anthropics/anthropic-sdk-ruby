# typed: strong

module Anthropic
  module Resources
    class Beta
      class Models
        # Get a specific model.
        #
        # The Models API response can be used to determine information about a specific
        # model or resolve a model alias to a model ID.
        sig do
          params(
            model_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaModelInfo)
        end
        def retrieve(
          # Model identifier or alias.
          model_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # List available models.
        #
        # The Models API response can be used to determine which models are available for
        # use in the API. More recently released models are listed first.
        sig do
          params(
            after_id: String,
            before_id: String,
            limit: Integer,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Internal::Page[Anthropic::Beta::BetaModelInfo])
        end
        def list(
          # Query param: ID of the object to use as a cursor for pagination. When provided,
          # returns the page of results immediately after this object.
          after_id: nil,
          # Query param: ID of the object to use as a cursor for pagination. When provided,
          # returns the page of results immediately before this object.
          before_id: nil,
          # Query param: Number of items to return per page.
          #
          # Defaults to `20`. Ranges from `1` to `1000`.
          limit: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
