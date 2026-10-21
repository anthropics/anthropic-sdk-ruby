# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentReference < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #
        #   @return [Symbol, :agent]
        required :type, const: :agent

        # @!attribute version
        #
        #   @return [Integer]
        required :version, Integer

        # @!method initialize(id:, version:, type: :agent)
        #   A resolved agent reference with a concrete version.
        #
        #   @param id [String]
        #   @param version [Integer]
        #   @param type [Symbol, :agent]
      end
    end

    BetaManagedAgentsAgentReference = Beta::BetaManagedAgentsAgentReference
  end
end
