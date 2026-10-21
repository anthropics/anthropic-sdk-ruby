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
        #   @return [Symbol, :url]
        required :type, const: :url

        # @!attribute url
        #
        #   @return [String]
        required :url, String

        # @!method initialize(name:, url:, type: :url)
        #   URL-based MCP server connection as returned in API responses.
        #
        #   @param name [String]
        #   @param url [String]
        #   @param type [Symbol, :url]
      end
    end

    BetaManagedAgentsMCPServerURLDefinition = Beta::BetaManagedAgentsMCPServerURLDefinition
  end
end
