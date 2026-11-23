# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The External Storage failed verification, so the request changed nothing.
        # `failed_checks` lists what to fix.
        class BetaStorageVerificationFailedError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :storage_verification_failed]

          # @return [Anthropic::Models::Beta::Organization::BetaStorageVerificationFailedErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaStorageVerificationFailedErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
