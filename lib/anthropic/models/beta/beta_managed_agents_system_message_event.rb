# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSystemMessageEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for this event.
        #
        #   @return [String]
        required :id, String

        # @!attribute content
        #   System content blocks. Text-only.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsSystemContentBlock>]
        required :content,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsSystemContentBlock] }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSystemMessageEvent::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsSystemMessageEvent::Type }

        # @!attribute processed_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time, nil]
        optional :processed_at, Time, nil?: true

        # @!method initialize(id:, content:, type:, processed_at: nil)
        #   A mid-conversation system message event. Carries system-role content that is
        #   appended to the session as a `role: "system"` turn.
        #
        #   @param id [String] Unique identifier for this event.
        #
        #   @param content [Array<Anthropic::Models::Beta::BetaManagedAgentsSystemContentBlock>] System content blocks. Text-only.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSystemMessageEvent::Type]
        #
        #   @param processed_at [Time, nil] A timestamp in RFC 3339 format

        # @see Anthropic::Models::Beta::BetaManagedAgentsSystemMessageEvent#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SYSTEM_MESSAGE = :"system.message"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSystemMessageEvent = Beta::BetaManagedAgentsSystemMessageEvent
  end
end
