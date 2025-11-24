# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaOutputConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute effort
        #   All possible effort levels.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaOutputConfig::Effort, nil]
        optional :effort, enum: -> { Anthropic::Beta::BetaOutputConfig::Effort }, nil?: true

        # @!method initialize(effort: nil)
        #   @param effort [Symbol, Anthropic::Models::Beta::BetaOutputConfig::Effort, nil] All possible effort levels.

        # All possible effort levels.
        #
        # @see Anthropic::Models::Beta::BetaOutputConfig#effort
        module Effort
          extend Anthropic::Internal::Type::Enum

          LOW = :low
          MEDIUM = :medium
          HIGH = :high

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaOutputConfig = Beta::BetaOutputConfig
  end
end
