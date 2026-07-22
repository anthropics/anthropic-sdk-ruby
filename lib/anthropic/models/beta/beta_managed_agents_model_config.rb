# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsModelConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   The model that will power your agent.
        #
        #   See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   details and options.
        #
        #   @return [Symbol, String, Anthropic::Models::Beta::BetaManagedAgentsModel]
        required :id, union: -> { Anthropic::Beta::BetaManagedAgentsModel }

        # @!attribute effort
        #   How hard Claude works on each turn. Sets `output_config.effort` on every
        #   Messages call the session makes.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsEffortLow, Anthropic::Models::Beta::BetaManagedAgentsEffortMedium, Anthropic::Models::Beta::BetaManagedAgentsEffortHigh, Anthropic::Models::Beta::BetaManagedAgentsEffortXhigh, Anthropic::Models::Beta::BetaManagedAgentsEffortMax, nil]
        optional :effort, union: -> { Anthropic::Beta::BetaManagedAgentsModelConfig::Effort }

        # @!attribute speed
        #   Inference speed mode. `fast` provides significantly faster output token
        #   generation at premium pricing. Not all models support `fast`; invalid
        #   combinations are rejected at create time.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsModelConfig::Speed, nil]
        optional :speed, enum: -> { Anthropic::Beta::BetaManagedAgentsModelConfig::Speed }

        # @!method initialize(id:, effort: nil, speed: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsModelConfig} for more details.
        #
        #   Model identifier and configuration.
        #
        #   @param id [Symbol, String, Anthropic::Models::Beta::BetaManagedAgentsModel] The model that will power your agent.
        #
        #   @param effort [Anthropic::Models::Beta::BetaManagedAgentsEffortLow, Anthropic::Models::Beta::BetaManagedAgentsEffortMedium, Anthropic::Models::Beta::BetaManagedAgentsEffortHigh, Anthropic::Models::Beta::BetaManagedAgentsEffortXhigh, Anthropic::Models::Beta::BetaManagedAgentsEffortMax] How hard Claude works on each turn. Sets `output_config.effort` on every Message
        #
        #   @param speed [Symbol, Anthropic::Models::Beta::BetaManagedAgentsModelConfig::Speed] Inference speed mode. `fast` provides significantly faster output token generati

        # How hard Claude works on each turn. Sets `output_config.effort` on every
        # Messages call the session makes.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsModelConfig#effort
        module Effort
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Low effort. Favors latency over reasoning depth.
          variant :low, -> { Anthropic::Beta::BetaManagedAgentsEffortLow }

          # Medium effort. Balances latency and reasoning depth.
          variant :medium, -> { Anthropic::Beta::BetaManagedAgentsEffortMedium }

          # High effort. Favors reasoning depth.
          variant :high, -> { Anthropic::Beta::BetaManagedAgentsEffortHigh }

          # Extra-high effort. Not all models accept this level.
          variant :xhigh, -> { Anthropic::Beta::BetaManagedAgentsEffortXhigh }

          # Maximum effort. Favors reasoning depth over latency.
          variant :max, -> { Anthropic::Beta::BetaManagedAgentsEffortMax }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsEffortLow, Anthropic::Models::Beta::BetaManagedAgentsEffortMedium, Anthropic::Models::Beta::BetaManagedAgentsEffortHigh, Anthropic::Models::Beta::BetaManagedAgentsEffortXhigh, Anthropic::Models::Beta::BetaManagedAgentsEffortMax)]
        end

        # Inference speed mode. `fast` provides significantly faster output token
        # generation at premium pricing. Not all models support `fast`; invalid
        # combinations are rejected at create time.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsModelConfig#speed
        module Speed
          extend Anthropic::Internal::Type::Enum

          STANDARD = :standard
          FAST = :fast

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsModelConfig = Beta::BetaManagedAgentsModelConfig
  end
end
