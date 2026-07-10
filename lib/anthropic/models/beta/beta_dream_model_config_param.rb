# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaDreamModelConfigParam < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Model identifier, e.g. "claude-opus-4-7". 1-256 characters.
        #
        #   @return [String]
        required :id, String

        # @!attribute speed
        #   Inference speed mode. `fast` provides significantly faster output token
        #   generation at premium pricing. Not all models support `fast`; invalid
        #   combinations are rejected at create time.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaDreamModelConfigParam::Speed, nil]
        optional :speed, enum: -> { Anthropic::Beta::BetaDreamModelConfigParam::Speed }, nil?: true

        # @!method initialize(id:, speed: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaDreamModelConfigParam} for more details.
        #
        #   Model identifier and configuration applied to every pipeline stage.
        #
        #   @param id [String] Model identifier, e.g. "claude-opus-4-7". 1-256 characters.
        #
        #   @param speed [Symbol, Anthropic::Models::Beta::BetaDreamModelConfigParam::Speed, nil] Inference speed mode. `fast` provides significantly faster output token generati

        # Inference speed mode. `fast` provides significantly faster output token
        # generation at premium pricing. Not all models support `fast`; invalid
        # combinations are rejected at create time.
        #
        # @see Anthropic::Models::Beta::BetaDreamModelConfigParam#speed
        module Speed
          extend Anthropic::Internal::Type::Enum

          STANDARD = :standard
          FAST = :fast

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaDreamModelConfigParam = Beta::BetaDreamModelConfigParam
  end
end
