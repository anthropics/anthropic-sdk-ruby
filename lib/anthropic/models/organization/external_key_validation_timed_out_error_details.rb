# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class ExternalKeyValidationTimedOutErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :external_key_validation_timed_out]
        required :error_code, const: :external_key_validation_timed_out

        # @!method initialize(error_code: :external_key_validation_timed_out)
        #   Anthropic's validation of the External Key did not finish in time, so the
        #   request was refused. Wait a moment, then send the request again.
        #
        #   @param error_code [Symbol, :external_key_validation_timed_out]
      end
    end
  end
end
