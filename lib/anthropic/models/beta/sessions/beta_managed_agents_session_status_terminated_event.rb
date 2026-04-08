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
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent::Type }

          # @!method initialize(id:, processed_at:, type:)
          #   Indicates the session has terminated, either due to an error or completion.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SESSION_STATUS_TERMINATED = :"session.status_terminated"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
