# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionStatusTerminatedEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute processed_at
          #   Timestamp of status change.
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, :"session.status_terminated"]
          required :type, const: :"session.status_terminated"

          # @!method initialize(id:, processed_at:, type: :"session.status_terminated")
          #   Indicates the session has terminated, either due to an error or completion.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] Timestamp of status change.
          #
          #   @param type [Symbol, :"session.status_terminated"]
        end
      end
    end
  end
end
