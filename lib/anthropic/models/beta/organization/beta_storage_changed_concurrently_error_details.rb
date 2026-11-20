# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaStorageChangedConcurrentlyErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :storage_changed_concurrently]
          required :error_code, const: :storage_changed_concurrently

          # @!attribute field
          #   The storage setting that changed.
          #
          #   @return [String]
          required :field, String

          # @!method initialize(field:, error_code: :storage_changed_concurrently)
          #   Another request changed this storage setting while this one was running, so this
          #   request left it as it is. Read the Workspace and send the request again if you
          #   still want the change.
          #
          #   @param field [String] The storage setting that changed.
          #
          #   @param error_code [Symbol, :storage_changed_concurrently]
        end
      end
    end
  end
end
