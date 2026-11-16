# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaDreamErrorObject < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   A human-readable explanation of why the dream failed.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #   A code for why the dream failed, such as `timeout` or `internal_error`.
        #
        #   The
        #   [Dreams guide](https://platform.claude.com/docs/en/managed-agents/dreams#errors)
        #   lists common error codes and when they occur.
        #
        #   @return [String]
        required :type, String

        # @!method initialize(message:, type:)
        #   Failure detail for a Dream whose `status` is `failed`.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaDreamErrorObject} for more details.
        #
        #   @param message [String] A human-readable explanation of why the dream failed.
        #
        #   @param type [String] A code for why the dream failed, such as `timeout` or `internal_error`.
      end
    end

    BetaDreamErrorObject = Beta::BetaDreamErrorObject
  end
end
