# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class ExternalKeyValidationFailedErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :external_key_validation_failed]
        required :error_code, const: :external_key_validation_failed

        # @!method initialize(error_code: :external_key_validation_failed)
        #   The External Key failed Anthropic's validation, so the request was refused. The
        #   message gives the reason, if there is one.
        #
        #   @param error_code [Symbol, :external_key_validation_failed]
      end
    end
  end
end
