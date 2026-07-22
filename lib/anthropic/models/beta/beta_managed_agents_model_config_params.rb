# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsModelConfigParams < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   The model that will power your agent.
        #
        #   See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   details and options.
        #
        #   @return [Symbol, String, Anthropic::Models::Beta::BetaManagedAgentsModel]
        required :id, union: -> { Anthropic::Beta::BetaManagedAgentsModel }

        # @!attribute effort
        #   How hard Claude works on each inference call. Accepts a bare level string
        #   (`"high"`) or `{"type": "high"}`. On create, omitting it resolves the per-model
        #   default; on update, omitting it leaves the stored value unchanged.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams::Effort::BetaManagedAgentsEffortLevel, Anthropic::Models::Beta::BetaManagedAgentsEffortLow, Anthropic::Models::Beta::BetaManagedAgentsEffortMedium, Anthropic::Models::Beta::BetaManagedAgentsEffortHigh, Anthropic::Models::Beta::BetaManagedAgentsEffortXhigh, Anthropic::Models::Beta::BetaManagedAgentsEffortMax, nil]
        optional :effort,
                 union: -> {
                   Anthropic::Beta::BetaManagedAgentsModelConfigParams::Effort
                 },
                 nil?: true

        # @!attribute speed
        #   Inference speed mode. `fast` provides significantly faster output token
        #   generation at premium pricing. Not all models support `fast`; invalid
        #   combinations are rejected at create time.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams::Speed, nil]
        optional :speed, enum: -> { Anthropic::Beta::BetaManagedAgentsModelConfigParams::Speed }, nil?: true

        # @!method initialize(id:, effort: nil, speed: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams} for more details.
        #
        #   An object that defines additional configuration control over model use
        #
        #   @param id [Symbol, String, Anthropic::Models::Beta::BetaManagedAgentsModel] The model that will power your agent.
        #
        #   @param effort [Symbol, Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams::Effort::BetaManagedAgentsEffortLevel, Anthropic::Models::Beta::BetaManagedAgentsEffortLow, Anthropic::Models::Beta::BetaManagedAgentsEffortMedium, Anthropic::Models::Beta::BetaManagedAgentsEffortHigh, Anthropic::Models::Beta::BetaManagedAgentsEffortXhigh, Anthropic::Models::Beta::BetaManagedAgentsEffortMax, nil] How hard Claude works on each inference call. Accepts a bare level string (`"hig
        #
        #   @param speed [Symbol, Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams::Speed, nil] Inference speed mode. `fast` provides significantly faster output token generati

        # How hard Claude works on each inference call. Accepts a bare level string
        # (`"high"`) or `{"type": "high"}`. On create, omitting it resolves the per-model
        # default; on update, omitting it leaves the stored value unchanged.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams#effort
        module Effort
          extend Anthropic::Internal::Type::Union

          # How hard Claude works on each turn. Higher levels favor reasoning depth over latency. Not all models accept every level; invalid combinations are rejected at create time.
          variant enum: -> { Anthropic::Beta::BetaManagedAgentsModelConfigParams::Effort::BetaManagedAgentsEffortLevel }

          # Low effort. Favors latency over reasoning depth.
          variant -> { Anthropic::Beta::BetaManagedAgentsEffortLow }

          # Medium effort. Balances latency and reasoning depth.
          variant -> { Anthropic::Beta::BetaManagedAgentsEffortMedium }

          # High effort. Favors reasoning depth.
          variant -> { Anthropic::Beta::BetaManagedAgentsEffortHigh }

          # Extra-high effort. Not all models accept this level.
          variant -> { Anthropic::Beta::BetaManagedAgentsEffortXhigh }

          # Maximum effort. Favors reasoning depth over latency.
          variant -> { Anthropic::Beta::BetaManagedAgentsEffortMax }

          # How hard Claude works on each turn. Higher levels favor reasoning depth over
          # latency. Not all models accept every level; invalid combinations are rejected at
          # create time.
          module BetaManagedAgentsEffortLevel
            extend Anthropic::Internal::Type::Enum

            LOW = :low
            MEDIUM = :medium
            HIGH = :high
            XHIGH = :xhigh
            MAX = :max

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Symbol, Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams::Effort::BetaManagedAgentsEffortLevel, Anthropic::Models::Beta::BetaManagedAgentsEffortLow, Anthropic::Models::Beta::BetaManagedAgentsEffortMedium, Anthropic::Models::Beta::BetaManagedAgentsEffortHigh, Anthropic::Models::Beta::BetaManagedAgentsEffortXhigh, Anthropic::Models::Beta::BetaManagedAgentsEffortMax)]
        end

        # Inference speed mode. `fast` provides significantly faster output token
        # generation at premium pricing. Not all models support `fast`; invalid
        # combinations are rejected at create time.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsModelConfigParams#speed
        module Speed
          extend Anthropic::Internal::Type::Enum

          STANDARD = :standard
          FAST = :fast

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsModelConfigParams = Beta::BetaManagedAgentsModelConfigParams
  end
end
