# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSessionStats < Anthropic::Internal::Type::BaseModel
        # @!attribute active_seconds
        #   Cumulative time in seconds the session spent in running status. Excludes idle
        #   time.
        #
        #   @return [Float, nil]
        optional :active_seconds, Float

        # @!attribute duration_seconds
        #   Elapsed time since session creation in seconds. For terminated sessions, frozen
        #   at the final update.
        #
        #   @return [Float, nil]
        optional :duration_seconds, Float

        # @!method initialize(active_seconds: nil, duration_seconds: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsSessionStats} for more details.
        #
        #   Timing statistics for a session.
        #
        #   @param active_seconds [Float] Cumulative time in seconds the session spent in running status. Excludes idle ti
        #
        #   @param duration_seconds [Float] Elapsed time since session creation in seconds. For terminated sessions, frozen
      end
    end

    BetaManagedAgentsSessionStats = Beta::BetaManagedAgentsSessionStats
  end
end
