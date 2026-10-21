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
        #   @return [Symbol, :commit]
        required :type, const: :commit

        # @!method initialize(sha:, type: :commit)
        #   @param sha [String] Full commit SHA to check out.
        #
        #   @param type [Symbol, :commit]
      end
    end

    BetaManagedAgentsCommitCheckout = Beta::BetaManagedAgentsCommitCheckout
  end
end
