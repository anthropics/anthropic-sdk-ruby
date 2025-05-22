# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRequestMCPServerToolConfiguration < Anthropic::Internal::Type::BaseModel
        # @!attribute allowed_tools
        #
        #   @return [Array<String>, nil]
        optional :allowed_tools, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute enabled
        #
        #   @return [Boolean, nil]
        optional :enabled, Anthropic::Internal::Type::Boolean, nil?: true

        # @!method initialize(allowed_tools: nil, enabled: nil)
        #   @param allowed_tools [Array<String>, nil]
        #   @param enabled [Boolean, nil]
      end
    end

    BetaRequestMCPServerToolConfiguration = Beta::BetaRequestMCPServerToolConfiguration
  end
end
