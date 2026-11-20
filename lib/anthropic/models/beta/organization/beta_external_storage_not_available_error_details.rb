# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaExternalStorageNotAvailableErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :external_storage_not_available]
          required :error_code, const: :external_storage_not_available

          # @!method initialize(error_code: :external_storage_not_available)
          #   External Storage isn't available for this Workspace, so only `internal` storage
          #   is accepted. The error's `message` says why.
          #
          #   @param error_code [Symbol, :external_storage_not_available]
        end
      end
    end
  end
end
