# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # External Storage isn't available for this Workspace, so only `internal` storage
        # is accepted. The error's `message` says why.
        class BetaExternalStorageNotAvailableError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :external_storage_not_available]

          # @return [Anthropic::Models::Beta::Organization::BetaExternalStorageNotAvailableErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaExternalStorageNotAvailableErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
