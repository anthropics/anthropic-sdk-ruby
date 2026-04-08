# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsModelConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   The model that will power your agent.\n\nSee
        #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   details and options.
        #
        #   @return [Symbol, String, Anthropic::Models::Beta::BetaManagedAgentsModel]
        required :id, union: -> { Anthropic::Beta::BetaManagedAgentsModel }

        # @!attribute speed
        #   Inference speed mode. `fast` provides significantly faster output token
        #   generation at premium pricing. Not all models support `fast`; invalid
        #   combinations are rejected at create time.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsModelConfig::Speed, nil]
        optional :speed, enum: -> { Anthropic::Beta::BetaManagedAgentsModelConfig::Speed }

        # @!method initialize(id:, speed: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsModelConfig} for more details.
        #
        #   Model identifier and configuration.
        #
        #   @param id [Symbol, String, Anthropic::Models::Beta::BetaManagedAgentsModel] The model that will power your agent.\n\nSee [models](https://docs.anthropic.com
        #
        #   @param speed [Symbol, Anthropic::Models::Beta::BetaManagedAgentsModelConfig::Speed] Inference speed mode. `fast` provides significantly faster output token generati

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
