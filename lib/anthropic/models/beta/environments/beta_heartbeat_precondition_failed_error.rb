# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Environments
        # `expected_last_heartbeat` does not match the stored heartbeat, so another worker
        # may hold the lease.
        class BetaHeartbeatPreconditionFailedError < Anthropic::Errors::PreconditionFailedError
          # @!method error_code
          #   @return [Symbol, :heartbeat_precondition_failed]

          # @return [Anthropic::Models::Beta::Environments::BetaHeartbeatPreconditionFailedErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Environments::BetaHeartbeatPreconditionFailedErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
