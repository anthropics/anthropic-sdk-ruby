# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMCPToolDefaultConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute defer_loading
        #
        #   @return [Boolean, nil]
        optional :defer_loading, Anthropic::Internal::Type::Boolean

        # @!attribute enabled
        #
        #   @return [Boolean, nil]
        optional :enabled, Anthropic::Internal::Type::Boolean

        # @!method initialize(defer_loading: nil, enabled: nil)
        #   Default configuration for tools in an MCP toolset.
        #
        #   @param defer_loading [Boolean]
        #   @param enabled [Boolean]
      end
    end

    BetaMCPToolDefaultConfig = Beta::BetaMCPToolDefaultConfig
  end
end
