# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaDreamError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [String]
        required :type, String

        # @!method initialize(message:, type:)
        #   Failure detail for a Dream whose `status` is `failed`.
        #
        #   @param message [String]
        #   @param type [String]
      end
    end

    BetaDreamError = Beta::BetaDreamError
  end
end
