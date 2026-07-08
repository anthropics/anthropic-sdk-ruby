# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaFallbackParam < Anthropic::Internal::Type::BaseModel
        # @!attribute model
        #   The model that will complete your prompt.
        #
        #   See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   details and options.
        #
        #   @return [Symbol, String, Anthropic::Models::Model]
        required :model, union: -> { Anthropic::Model }

        # @!attribute max_tokens
        #
        #   @return [Integer, nil]
        optional :max_tokens, Integer, nil?: true

        # @!attribute output_config
        #
        #   @return [Anthropic::Models::Beta::BetaOutputConfig, nil]
        optional :output_config, -> { Anthropic::Beta::BetaOutputConfig }, nil?: true

        # @!attribute speed
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaFallbackParam::Speed, nil]
        optional :speed, enum: -> { Anthropic::Beta::BetaFallbackParam::Speed }, nil?: true

        # @!attribute thinking
        #
        #   @return [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled, Anthropic::Models::Beta::BetaThinkingConfigAdaptive, nil]
        optional :thinking, union: -> { Anthropic::Beta::BetaFallbackParam::Thinking }, nil?: true

        # @!method initialize(model:, max_tokens: nil, output_config: nil, speed: nil, thinking: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaFallbackParam} for more details.
        #
        #   One entry in the `fallbacks` chain on a `/v1/messages` request.
        #
        #   `model` is required. The override fields (`max_tokens`, `thinking`,
        #   `output_config`, and `speed`) set the corresponding parameter for this attempt
        #   only and are validated as if the request were made to `model`. Any other key is
        #   rejected at parse time.
        #
        #   @param model [Symbol, String, Anthropic::Models::Model] The model that will complete your prompt.
        #
        #   @param max_tokens [Integer, nil]
        #
        #   @param output_config [Anthropic::Models::Beta::BetaOutputConfig, nil]
        #
        #   @param speed [Symbol, Anthropic::Models::Beta::BetaFallbackParam::Speed, nil]
        #
        #   @param thinking [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled, Anthropic::Models::Beta::BetaThinkingConfigAdaptive, nil]

        # @see Anthropic::Models::Beta::BetaFallbackParam#speed
        module Speed
          extend Anthropic::Internal::Type::Enum

          STANDARD = :standard
          FAST = :fast

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Anthropic::Models::Beta::BetaFallbackParam#thinking
        module Thinking
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :enabled, -> { Anthropic::Beta::BetaThinkingConfigEnabled }

          variant :disabled, -> { Anthropic::Beta::BetaThinkingConfigDisabled }

          variant :adaptive, -> { Anthropic::Beta::BetaThinkingConfigAdaptive }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled, Anthropic::Models::Beta::BetaThinkingConfigAdaptive)]
        end
      end
    end

    BetaFallbackParam = Beta::BetaFallbackParam
  end
end
