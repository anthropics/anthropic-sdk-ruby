# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # Anthropic's validation of the External Key did not finish in time, so the
      # request was refused. Wait a moment, then send the request again.
      class ExternalKeyValidationTimedOutError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :external_key_validation_timed_out]

        # @return [Anthropic::Models::Organization::ExternalKeyValidationTimedOutErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::ExternalKeyValidationTimedOutErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
