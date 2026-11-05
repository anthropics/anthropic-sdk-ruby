# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The External Key failed Anthropic's validation, so the request was refused. The
      # message gives the reason, if there is one.
      class ExternalKeyValidationFailedError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :external_key_validation_failed]

        # @return [Anthropic::Models::Organization::ExternalKeyValidationFailedErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::ExternalKeyValidationFailedErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
