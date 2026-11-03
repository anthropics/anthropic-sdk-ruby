# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaScanFailedErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :scan_failed]
          required :error_code, const: :scan_failed

          # @!attribute plugin_version_id
          #
          #   @return [String]
          required :plugin_version_id, String

          # @!method initialize(plugin_version_id:, error_code: :scan_failed)
          #   The content scan of the version in `plugin_version_id` failed, errored or
          #   reached no verdict, so the version cannot be served.
          #
          #   @param plugin_version_id [String]
          #   @param error_code [Symbol, :scan_failed]
        end
      end
    end
  end
end
