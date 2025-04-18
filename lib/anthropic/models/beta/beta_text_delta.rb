# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextDelta < Anthropic::Internal::Type::BaseModel
        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute type
        #
        #   @return [Symbol, :text_delta]
        required :type, const: :text_delta

        # @!method initialize(text:, type: :text_delta)
        #   @param text [String]
        #   @param type [Symbol, :text_delta]
      end
    end

    BetaTextDelta = Beta::BetaTextDelta
  end
end
