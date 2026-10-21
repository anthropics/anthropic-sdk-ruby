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
          #   Timestamp when the session was deleted.
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, :"session.deleted"]
          required :type, const: :"session.deleted"

          # @!method initialize(id:, processed_at:, type: :"session.deleted")
          #   Emitted when a session has been deleted. Terminates any active event stream — no
          #   further events will be emitted for this session.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] Timestamp when the session was deleted.
          #
          #   @param type [Symbol, :"session.deleted"]
        end
      end
    end
  end
end
