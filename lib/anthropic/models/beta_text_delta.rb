# frozen_string_literal: true

module Anthropic
  module Models
    class BetaTextDelta < BaseModel
      # @!attribute [rw] text
      #   @return [String]
      required :text, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaTextDelta::Type]
      required :type, enum: -> { Anthropic::Models::BetaTextDelta::Type }

      class Type < Anthropic::Enum
        TEXT_DELTA = :text_delta
      end

      # Create a new instance of BetaTextDelta from a Hash of raw data.
      #
      # @overload initialize(text: nil, type: nil)
      # @param text [String]
      # @param type [String]
      def initialize(data = {})
        super
      end
    end
  end
end
