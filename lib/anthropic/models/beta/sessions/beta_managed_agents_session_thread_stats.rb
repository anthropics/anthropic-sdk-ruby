# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionThreadStats < Anthropic::Internal::Type::BaseModel
          # @!attribute active_seconds
          #   Cumulative time in seconds the thread spent actively running. Excludes idle
          #   time.
          #
          #   @return [Float, nil]
          optional :active_seconds, Float

          # @!attribute duration_seconds
          #   Elapsed time since thread creation in seconds. For archived threads, frozen at
          #   the final update.
          #
          #   @return [Float, nil]
          optional :duration_seconds, Float

          # @!attribute startup_seconds
          #   Time in seconds for the thread to begin running. Zero for child threads, which
          #   start immediately.
          #
          #   @return [Float, nil]
          optional :startup_seconds, Float

          # @!method initialize(active_seconds: nil, duration_seconds: nil, startup_seconds: nil)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStats} for
          #   more details.
          #
          #   Timing statistics for a session thread.
          #
          #   @param active_seconds [Float] Cumulative time in seconds the thread spent actively running. Excludes idle time
          #
          #   @param duration_seconds [Float] Elapsed time since thread creation in seconds. For archived threads, frozen at t
          #
          #   @param startup_seconds [Float] Time in seconds for the thread to begin running. Zero for child threads, which s
        end
      end
    end
  end
end
