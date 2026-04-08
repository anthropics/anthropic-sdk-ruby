# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionRetriesExhausted < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted::Type }

          # @!method initialize(type:)
          #   The turn ended because the retry budget was exhausted (`max_iterations` hit or
          #   an error escalated to `retry_status: 'exhausted'`).
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted#type
          module Type
            extend Anthropic::Internal::Type::Enum

            RETRIES_EXHAUSTED = :retries_exhausted

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
