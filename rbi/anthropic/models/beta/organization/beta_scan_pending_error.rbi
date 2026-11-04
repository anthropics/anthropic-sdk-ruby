# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The content scan of the version in `plugin_version_id` is still running. Retry
        # once the scan finishes.
        class BetaScanPendingError < Anthropic::Errors::ConflictError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(Anthropic::Beta::Organization::BetaScanPendingErrorDetails)
          end
          def details
          end
        end
      end
    end
  end
end
