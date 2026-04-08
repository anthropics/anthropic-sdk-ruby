# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMCPServerURLDefinition < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMCPServerURLDefinition::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition::Type }

        # @!attribute url
        #
        #   @return [String]
        required :url, String

        # @!method initialize(name:, type:, url:)
        #   URL-based MCP server connection as returned in API responses.
        #
        #   @param name [String]
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMCPServerURLDefinition::Type]
        #   @param url [String]

        # @see Anthropic::Models::Beta::BetaManagedAgentsMCPServerURLDefinition#type
        module Type
          extend Anthropic::Internal::Type::Enum

          URL = :url

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsMCPServerURLDefinition = Beta::BetaManagedAgentsMCPServerURLDefinition
  end
end
