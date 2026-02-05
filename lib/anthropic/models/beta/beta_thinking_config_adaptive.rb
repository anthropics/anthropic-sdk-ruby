# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThinkingConfigAdaptive < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :adaptive]
        required :type, const: :adaptive

        # @!method initialize(type: :adaptive)
        #   @param type [Symbol, :adaptive]
      end
    end

    BetaThinkingConfigAdaptive = Beta::BetaThinkingConfigAdaptive
  end
end
