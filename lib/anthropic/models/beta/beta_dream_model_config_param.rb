# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaDreamModelConfigParam < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   The ID of the model to run the dream with.
        #
        #   The ID can be 1 to 256 characters long.
        #
        #   The
        #   [limits table in the Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#limits)
        #   lists the supported models.
        #
        #   @return [String]
        required :id, String

        # @!attribute speed
        #   How fast the model generates output for the dream. Defaults to `standard`.
        #
        #   Dreams accept only `standard`.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaDreamModelConfigParam::Speed, nil]
        optional :speed, enum: -> { Anthropic::Beta::BetaDreamModelConfigParam::Speed }, nil?: true

        # @!method initialize(id:, speed: nil)
        #   The object form of `model` in a request to create a dream.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaDreamModelConfigParam} for more details.
        #
        #   @param id [String] The ID of the model to run the dream with.
        #
        #   @param speed [Symbol, Anthropic::Models::Beta::BetaDreamModelConfigParam::Speed, nil] How fast the model generates output for the dream. Defaults to `standard`.

        # How fast the model generates output for the dream. Defaults to `standard`.
        #
        # Dreams accept only `standard`.
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
