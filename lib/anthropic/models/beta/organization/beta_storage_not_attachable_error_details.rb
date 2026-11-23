# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaStorageNotAttachableErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :storage_not_attachable]
          required :error_code, const: :storage_not_attachable

          # @!attribute field
          #   The request field at fault.
          #
          #   @return [String]
          required :field, String

          # @!method initialize(field:, error_code: :storage_not_attachable)
          #   This External Storage can't be attached to the setting named in `field`. The
          #   error's `message` says why.
          #
          #   @param field [String] The request field at fault.
          #
          #   @param error_code [Symbol, :storage_not_attachable]
        end
      end
    end
  end
end
