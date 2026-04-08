# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRetryStatusRetrying < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying::Type }

          # @!method initialize(type:)
          #   The server is retrying automatically. Client should wait; the same error type
          #   may fire again as retrying, then once as exhausted when the retry budget runs
          #   out.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying#type
          module Type
            extend Anthropic::Internal::Type::Enum

            RETRYING = :retrying

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
