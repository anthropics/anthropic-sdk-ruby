# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaAdvisorResultBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute type
        #
        #   @return [Symbol, :advisor_result]
        required :type, const: :advisor_result

        # @!method initialize(text:, type: :advisor_result)
        #   @param text [String]
        #   @param type [Symbol, :advisor_result]
      end
    end

    BetaAdvisorResultBlockParam = Beta::BetaAdvisorResultBlockParam
  end
end
