# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The External Storage is `active` or `draining`, so this delete didn't erase it.
        # The message says what to do next. On `draining` storage this delete may have
        # started a removal that can't be undone: get the storage and read
        # `status.removal_started`.
        class BetaExternalStorageInUseError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :external_storage_in_use]

          # @return [Anthropic::Models::Beta::Organization::BetaExternalStorageInUseErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaExternalStorageInUseErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
