# typed: strong

module Anthropic
  module Models
    module Beta
      module Environments
        class BetaHeartbeatPreconditionFailedErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Environments::BetaHeartbeatPreconditionFailedErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          # The lease as the server holds it.
          sig { returns(Anthropic::Beta::Environments::BetaWorkLeaseState) }
          attr_reader :current_state

          sig do
            params(
              current_state:
                Anthropic::Beta::Environments::BetaWorkLeaseState::OrHash
            ).void
          end
          attr_writer :current_state

          sig { returns(Symbol) }
          attr_accessor :error_code

          # `expected_last_heartbeat` does not match the stored heartbeat, so another worker
          # may hold the lease.
          sig do
            params(
              current_state:
                Anthropic::Beta::Environments::BetaWorkLeaseState::OrHash,
              error_code: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The lease as the server holds it.
            current_state:,
            error_code: :heartbeat_precondition_failed
          )
          end

          sig do
            override.returns(
              {
                current_state:
                  Anthropic::Beta::Environments::BetaWorkLeaseState,
                error_code: Symbol
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
