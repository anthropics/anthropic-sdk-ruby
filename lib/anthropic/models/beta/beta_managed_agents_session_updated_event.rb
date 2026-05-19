# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSessionUpdatedEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for this event.
        #
        #   @return [String]
        required :id, String

        # @!attribute processed_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :processed_at, Time

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionUpdatedEvent::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsSessionUpdatedEvent::Type }

        # @!attribute agent
        #   Resolved `agent` definition for a `session`. Snapshot of the `agent` at
        #   `session` creation time.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsSessionAgent, nil]
        optional :agent, -> { Anthropic::Beta::BetaManagedAgentsSessionAgent }, nil?: true

        # @!attribute metadata
        #   The session's full metadata bag after the update. Present when the update set
        #   non-empty metadata; absent when metadata was unchanged or cleared to empty.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute title
        #   The session's new title. Present only when the update changed it.
        #
        #   @return [String, nil]
        optional :title, String, nil?: true

        # @!method initialize(id:, processed_at:, type:, agent: nil, metadata: nil, title: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsSessionUpdatedEvent} for more
        #   details.
        #
        #   Emitted when an UpdateSession request changed at least one field. Carries only
        #   the fields that changed; absent fields were not part of the update. The new
        #   configuration applies from the next turn.
        #
        #   @param id [String] Unique identifier for this event.
        #
        #   @param processed_at [Time] A timestamp in RFC 3339 format
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionUpdatedEvent::Type]
        #
        #   @param agent [Anthropic::Models::Beta::BetaManagedAgentsSessionAgent, nil] Resolved `agent` definition for a `session`. Snapshot of the `agent` at `session
        #
        #   @param metadata [Hash{Symbol=>String}] The session's full metadata bag after the update. Present when the update set no
        #
        #   @param title [String, nil] The session's new title. Present only when the update changed it.

        # @see Anthropic::Models::Beta::BetaManagedAgentsSessionUpdatedEvent#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SESSION_UPDATED = :"session.updated"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSessionUpdatedEvent = Beta::BetaManagedAgentsSessionUpdatedEvent
  end
end
