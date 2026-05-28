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

        # @!attribute stop_reason
        #
        #   @return [String, nil]
        optional :stop_reason, String, nil?: true

        # @!method initialize(text:, stop_reason: nil, type: :advisor_result)
        #   @param text [String]
        #   @param stop_reason [String, nil]
        #   @param type [Symbol, :advisor_result]
      end
    end

    BetaAdvisorResultBlockParam = Beta::BetaAdvisorResultBlockParam
  end
end
