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
        #   @return [Symbol, :branch]
        required :type, const: :branch

        # @!method initialize(name:, type: :branch)
        #   @param name [String] Branch name to check out.
        #
        #   @param type [Symbol, :branch]
      end
    end

    BetaManagedAgentsBranchCheckout = Beta::BetaManagedAgentsBranchCheckout
  end
end
