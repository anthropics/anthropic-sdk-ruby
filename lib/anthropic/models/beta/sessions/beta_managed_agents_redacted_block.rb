# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRedactedBlock < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRedactedBlock::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock::Type }

          # @!method initialize(type:)
          #   Placeholder for content withheld by Anthropic model policy.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRedactedBlock::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsRedactedBlock#type
          module Type
            extend Anthropic::Internal::Type::Enum

            REDACTED = :redacted

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
