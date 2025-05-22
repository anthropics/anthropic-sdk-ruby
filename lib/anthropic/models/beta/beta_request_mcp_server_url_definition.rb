# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRequestMCPServerURLDefinition < Anthropic::Internal::Type::BaseModel
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

        # @!attribute authorization_token
        #
        #   @return [String, nil]
        optional :authorization_token, String, nil?: true

        # @!attribute tool_configuration
        #
        #   @return [Anthropic::Models::Beta::BetaRequestMCPServerToolConfiguration, nil]
        optional :tool_configuration,
                 -> {
                   Anthropic::Beta::BetaRequestMCPServerToolConfiguration
                 },
                 nil?: true

        # @!method initialize(name:, url:, authorization_token: nil, tool_configuration: nil, type: :url)
        #   @param name [String]
        #   @param url [String]
        #   @param authorization_token [String, nil]
        #   @param tool_configuration [Anthropic::Models::Beta::BetaRequestMCPServerToolConfiguration, nil]
        #   @param type [Symbol, :url]
      end
    end

    BetaRequestMCPServerURLDefinition = Beta::BetaRequestMCPServerURLDefinition
  end
end
