# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaSystemMessageOutputConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute effort
        #   All possible effort levels.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaSystemMessageOutputConfig::Effort, nil]
        optional :effort, enum: -> { Anthropic::Beta::BetaSystemMessageOutputConfig::Effort }, nil?: true

        # @!method initialize(effort: nil)
        #   Per-message output configuration on a role:"system" input message.
        #
        #   Fields here apply per-turn; `format` remains top-level only. An empty `{}` is
        #   accepted on a message that carries content; a message with neither content nor
        #   output_config fields is rejected.
        #
        #   @param effort [Symbol, Anthropic::Models::Beta::BetaSystemMessageOutputConfig::Effort, nil] All possible effort levels.

        # All possible effort levels.
        #
        # @see Anthropic::Models::Beta::BetaSystemMessageOutputConfig#effort
        module Effort
          extend Anthropic::Internal::Type::Enum

          LOW = :low
          MEDIUM = :medium
          HIGH = :high
          XHIGH = :xhigh
          MAX = :max

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaSystemMessageOutputConfig = Beta::BetaSystemMessageOutputConfig
  end
end
