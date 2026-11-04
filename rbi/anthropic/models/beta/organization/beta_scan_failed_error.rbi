# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The version in `plugin_version_id` did not pass its content scan, so it cannot
        # be served.
        class BetaScanFailedError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(Anthropic::Beta::Organization::BetaScanFailedErrorDetails)
          end
          def details
          end
        end
      end
    end
  end
end
