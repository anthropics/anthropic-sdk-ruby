# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Opt-in server-side retry on one or more substitute models when the requested
      # model declines for policy reasons. Tried in order: if the first entry also
      # declines, the second is tried, and so on. The string "default" requests the
      # requested model's server-defined default fallback configuration.
      module BetaFallbacksParam
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::Models::Beta::BetaFallbacksParam::BetaFallbackParamArray }

        variant const: :default

        # @!method self.variants
        #   @return [Array(Array<Anthropic::Models::Beta::BetaFallbackParam>, Symbol, :default)]

        # @type [Anthropic::Internal::Type::Converter]
        BetaFallbackParamArray = Anthropic::Internal::Type::ArrayOf[-> { Anthropic::Beta::BetaFallbackParam }]
      end
    end

    BetaFallbacksParam = Beta::BetaFallbacksParam
  end
end
