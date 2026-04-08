# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionStats = Beta::BetaManagedAgentsSessionStats

    module Beta
      class BetaManagedAgentsSessionStats < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionStats,
              Anthropic::Internal::AnyHash
            )
          end

        # Cumulative time in seconds the session spent in running status. Excludes idle
        # time.
        sig { returns(T.nilable(Float)) }
        attr_reader :active_seconds

        sig { params(active_seconds: Float).void }
        attr_writer :active_seconds

        # Elapsed time since session creation in seconds. For terminated sessions, frozen
        # at the final update.
        sig { returns(T.nilable(Float)) }
        attr_reader :duration_seconds

        sig { params(duration_seconds: Float).void }
        attr_writer :duration_seconds

        # Timing statistics for a session.
        sig do
          params(active_seconds: Float, duration_seconds: Float).returns(
            T.attached_class
          )
        end
        def self.new(
          # Cumulative time in seconds the session spent in running status. Excludes idle
          # time.
          active_seconds: nil,
          # Elapsed time since session creation in seconds. For terminated sessions, frozen
          # at the final update.
          duration_seconds: nil
        )
        end

        sig do
          override.returns({ active_seconds: Float, duration_seconds: Float })
        end
        def to_hash
        end
      end
    end
  end
end
