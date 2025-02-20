# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextDelta < Anthropic::BaseModel
        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute type
        #
        #   @return [Symbol, :text_delta]
        required :type, const: :text_delta

        # @!parse
        #   # @param text [String]
        #   # @param type [Symbol, :text_delta]
        #   #
        #   def initialize(text:, type: :text_delta, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaTextDelta = Beta::BetaTextDelta
  end
end
