# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionStatusRescheduledEvent < Anthropic::Internal::Type::BaseModel
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
          #   @return [Symbol, :"session.status_rescheduled"]
          required :type, const: :"session.status_rescheduled"

          # @!method initialize(id:, processed_at:, type: :"session.status_rescheduled")
          #   Indicates the session is recovering from an error state and is rescheduled for
          #   execution.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] Timestamp of status change.
          #
          #   @param type [Symbol, :"session.status_rescheduled"]
        end
      end
    end
  end
end
