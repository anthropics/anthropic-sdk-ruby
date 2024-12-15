# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextBlockParam < Anthropic::BaseModel
        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaTextBlockParam::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaTextBlockParam::Type }

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

        # @!parse
        #   # @param text [String]
        #   # @param type [String]
        #   # @param cache_control [Object, nil]
        #   #
        #   def initialize(text:, type:, cache_control: nil) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        class Type < Anthropic::Enum
          TEXT = :text
        end
      end
    end

    BetaTextBlockParam = Beta::BetaTextBlockParam
  end
end
