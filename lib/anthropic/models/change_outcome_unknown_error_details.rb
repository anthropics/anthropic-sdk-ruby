# frozen_string_literal: true

module Anthropic
  module Models
    class ChangeOutcomeUnknownErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :change_outcome_unknown]
      required :error_code, const: :change_outcome_unknown

      # @!method initialize(error_code: :change_outcome_unknown)
      #   Some of the request's changes may have been saved and others not. Send the same
      #   request again to finish it; changes already saved aren't repeated.
      #
      #   @param error_code [Symbol, :change_outcome_unknown]
    end
  end
end
