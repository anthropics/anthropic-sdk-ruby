# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaExternalStorageInUseErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :external_storage_in_use]
          required :error_code, const: :external_storage_in_use

          # @!method initialize(error_code: :external_storage_in_use)
          #   The External Storage is `active` or `draining`, so this delete didn't erase it.
          #   The message says what to do next. On `draining` storage this delete may have
          #   started a removal that can't be undone: get the storage and read
          #   `status.removal_started`.
          #
          #   @param error_code [Symbol, :external_storage_in_use]
        end
      end
    end
  end
end
