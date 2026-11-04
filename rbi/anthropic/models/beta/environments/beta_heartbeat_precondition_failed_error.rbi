# typed: strong

module Anthropic
  module Models
    module Beta
      module Environments
        # `expected_last_heartbeat` does not match the stored heartbeat, so another worker
        # may hold the lease.
        class BetaHeartbeatPreconditionFailedError < Anthropic::Errors::PreconditionFailedError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Environments::BetaHeartbeatPreconditionFailedErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
