# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Environments
        # @see Anthropic::Resources::Beta::Environments::Work#heartbeat
        class BetaSelfHostedWorkHeartbeatResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute last_heartbeat
          #   RFC 3339 timestamp of the actual heartbeat from DB
          #
          #   @return [String]
          required :last_heartbeat, String

          # @!attribute lease_extended
          #   Whether the heartbeat succeeded in extending the lease
          #
          #   @return [Boolean]
          required :lease_extended, Anthropic::Internal::Type::Boolean

          # @!attribute state
          #   Current state of the work item (active/stopping/stopped)
          #
          #   @return [Symbol, Anthropic::Models::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse::State]
          required :state, enum: -> { Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse::State }

          # @!attribute ttl_seconds
          #   Effective TTL applied to the lease
          #
          #   @return [Integer]
          required :ttl_seconds, Integer

          # @!attribute type
          #   The type of response
          #
          #   @return [Symbol, :work_heartbeat]
          required :type, const: :work_heartbeat

          # @!method initialize(last_heartbeat:, lease_extended:, state:, ttl_seconds:, type: :work_heartbeat)
          #   Response after recording a heartbeat for a work item.
          #
          #   @param last_heartbeat [String] RFC 3339 timestamp of the actual heartbeat from DB
          #
          #   @param lease_extended [Boolean] Whether the heartbeat succeeded in extending the lease
          #
          #   @param state [Symbol, Anthropic::Models::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse::State] Current state of the work item (active/stopping/stopped)
          #
          #   @param ttl_seconds [Integer] Effective TTL applied to the lease
          #
          #   @param type [Symbol, :work_heartbeat] The type of response

          # Current state of the work item (active/stopping/stopped)
          #
          # @see Anthropic::Models::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse#state
          module State
            extend Anthropic::Internal::Type::Enum

            QUEUED = :queued
            STARTING = :starting
            ACTIVE = :active
            STOPPING = :stopping
            STOPPED = :stopped

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
