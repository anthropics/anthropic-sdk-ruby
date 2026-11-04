# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The content scan of the version in `plugin_version_id` is still running. Retry
        # once the scan finishes.
        class BetaScanPendingError < Anthropic::Errors::ConflictError
          # @!method error_code
          #   @return [Symbol, :scan_pending]

          # @return [Anthropic::Models::Beta::Organization::BetaScanPendingErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaScanPendingErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
