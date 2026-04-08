# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionDeletedEvent < Anthropic::Internal::Type::BaseModel
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
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent::Type }

          # @!method initialize(id:, processed_at:, type:)
          #   Emitted when a session has been deleted. Terminates any active event stream — no
          #   further events will be emitted for this session.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SESSION_DELETED = :"session.deleted"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
