# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Environments
        class BetaWorkLeaseState < Anthropic::Internal::Type::BaseModel
          # @!attribute last_heartbeat
          #   RFC 3339 timestamp of the stored heartbeat, or null if there has been none
          #
          #   @return [String, nil]
          required :last_heartbeat, String, nil?: true

          # @!attribute lease_extended
          #   Always false: a refused heartbeat does not extend the lease
          #
          #   @return [Boolean]
          required :lease_extended, Anthropic::Internal::Type::Boolean

          # @!attribute state
          #   Current state of the work item
          #
          #   @return [Symbol, Anthropic::Models::Beta::Environments::BetaWorkLeaseState::State]
          required :state, enum: -> { Anthropic::Beta::Environments::BetaWorkLeaseState::State }

          # @!attribute ttl_seconds
          #   TTL of the lease
          #
          #   @return [Integer]
          required :ttl_seconds, Integer

          # @!method initialize(last_heartbeat:, lease_extended:, state:, ttl_seconds:)
          #   A work item's lease as the server holds it.
          #
          #   @param last_heartbeat [String, nil] RFC 3339 timestamp of the stored heartbeat, or null if there has been none
          #
          #   @param lease_extended [Boolean] Always false: a refused heartbeat does not extend the lease
          #
          #   @param state [Symbol, Anthropic::Models::Beta::Environments::BetaWorkLeaseState::State] Current state of the work item
          #
          #   @param ttl_seconds [Integer] TTL of the lease

          # Current state of the work item
          #
          # @see Anthropic::Models::Beta::Environments::BetaWorkLeaseState#state
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
