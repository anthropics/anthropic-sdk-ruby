# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsCommitCheckout < Anthropic::Internal::Type::BaseModel
        # @!attribute sha
        #   Full commit SHA to check out.
        #
        #   @return [String]
        required :sha, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsCommitCheckout::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsCommitCheckout::Type }

        # @!method initialize(sha:, type:)
        #   @param sha [String] Full commit SHA to check out.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsCommitCheckout::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsCommitCheckout#type
        module Type
          extend Anthropic::Internal::Type::Enum

          COMMIT = :commit

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsCommitCheckout = Beta::BetaManagedAgentsCommitCheckout
  end
end
