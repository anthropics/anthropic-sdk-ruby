# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaScanPendingErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :scan_pending]
          required :error_code, const: :scan_pending

          # @!attribute plugin_version_id
          #
          #   @return [String]
          required :plugin_version_id, String

          # @!method initialize(plugin_version_id:, error_code: :scan_pending)
          #   The content scan of the version in `plugin_version_id` is still running. Retry
          #   once the scan finishes.
          #
          #   @param plugin_version_id [String]
          #   @param error_code [Symbol, :scan_pending]
        end
      end
    end
  end
end
