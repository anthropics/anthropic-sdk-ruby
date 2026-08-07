# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaFallbackInfo < Anthropic::Internal::Type::BaseModel
        # @!attribute model
        #   The model that will complete your prompt.
        #
        #   See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   details and options.
        #
        #   @return [Symbol, String, Anthropic::Models::Model]
        required :model, union: -> { Anthropic::Model }

        # @!method initialize(model:)
        #   Identifies one hop of a fallback transition.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaFallbackInfo} for more details.
        #
        #   @param model [Symbol, String, Anthropic::Models::Model] The model that will complete your prompt.
      end
    end

    BetaFallbackInfo = Beta::BetaFallbackInfo
  end
end
