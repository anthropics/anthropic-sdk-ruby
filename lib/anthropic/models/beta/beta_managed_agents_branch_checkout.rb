# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsBranchCheckout < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Branch name to check out.
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsBranchCheckout::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsBranchCheckout::Type }

        # @!method initialize(name:, type:)
        #   @param name [String] Branch name to check out.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsBranchCheckout::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsBranchCheckout#type
        module Type
          extend Anthropic::Internal::Type::Enum

          BRANCH = :branch

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsBranchCheckout = Beta::BetaManagedAgentsBranchCheckout
  end
end
