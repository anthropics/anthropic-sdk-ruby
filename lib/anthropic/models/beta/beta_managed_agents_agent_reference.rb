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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentReference::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsAgentReference::Type }

        # @!attribute version
        #
        #   @return [Integer]
        required :version, Integer

        # @!method initialize(id:, type:, version:)
        #   A resolved agent reference with a concrete version.
        #
        #   @param id [String]
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentReference::Type]
        #   @param version [Integer]

        # @see Anthropic::Models::Beta::BetaManagedAgentsAgentReference#type
        module Type
          extend Anthropic::Internal::Type::Enum

          AGENT = :agent

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsAgentReference = Beta::BetaManagedAgentsAgentReference
  end
end
