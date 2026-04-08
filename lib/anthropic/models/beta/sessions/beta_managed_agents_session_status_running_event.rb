# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionStatusRunningEvent < Anthropic::Internal::Type::BaseModel
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
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent::Type }

          # @!method initialize(id:, processed_at:, type:)
          #   Indicates the session is actively running and the agent is working.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SESSION_STATUS_RUNNING = :"session.status_running"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
