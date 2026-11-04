# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Environments
        class BetaHeartbeatPreconditionFailedErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute current_state
          #   The lease as the server holds it.
          #
          #   @return [Anthropic::Models::Beta::Environments::BetaWorkLeaseState]
          required :current_state, -> { Anthropic::Beta::Environments::BetaWorkLeaseState }

          # @!attribute error_code
          #
          #   @return [Symbol, :heartbeat_precondition_failed]
          required :error_code, const: :heartbeat_precondition_failed

          # @!method initialize(current_state:, error_code: :heartbeat_precondition_failed)
          #   `expected_last_heartbeat` does not match the stored heartbeat, so another worker
          #   may hold the lease.
          #
          #   @param current_state [Anthropic::Models::Beta::Environments::BetaWorkLeaseState] The lease as the server holds it.
          #
          #   @param error_code [Symbol, :heartbeat_precondition_failed]
        end
      end
    end
  end
end
