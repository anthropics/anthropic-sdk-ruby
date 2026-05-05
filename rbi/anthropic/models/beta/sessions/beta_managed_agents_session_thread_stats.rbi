# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionThreadStats < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStats,
                Anthropic::Internal::AnyHash
              )
            end

          # Cumulative time in seconds the thread spent actively running. Excludes idle
          # time.
          sig { returns(T.nilable(Float)) }
          attr_reader :active_seconds

          sig { params(active_seconds: Float).void }
          attr_writer :active_seconds

          # Elapsed time since thread creation in seconds. For archived threads, frozen at
          # the final update.
          sig { returns(T.nilable(Float)) }
          attr_reader :duration_seconds

          sig { params(duration_seconds: Float).void }
          attr_writer :duration_seconds

          # Time in seconds for the thread to begin running. Zero for child threads, which
          # start immediately.
          sig { returns(T.nilable(Float)) }
          attr_reader :startup_seconds

          sig { params(startup_seconds: Float).void }
          attr_writer :startup_seconds

          # Timing statistics for a session thread.
          sig do
            params(
              active_seconds: Float,
              duration_seconds: Float,
              startup_seconds: Float
            ).returns(T.attached_class)
          end
          def self.new(
            # Cumulative time in seconds the thread spent actively running. Excludes idle
            # time.
            active_seconds: nil,
            # Elapsed time since thread creation in seconds. For archived threads, frozen at
            # the final update.
            duration_seconds: nil,
            # Time in seconds for the thread to begin running. Zero for child threads, which
            # start immediately.
            startup_seconds: nil
          )
          end

          sig do
            override.returns(
              {
                active_seconds: Float,
                duration_seconds: Float,
                startup_seconds: Float
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
