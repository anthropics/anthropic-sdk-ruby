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
        #   @return [Symbol, :"system.message"]
        required :type, const: :"system.message"

        # @!attribute processed_at
        #   Timestamp when this system message was processed.
        #
        #   @return [Time, nil]
        optional :processed_at, Time, nil?: true

        # @!method initialize(id:, content:, processed_at: nil, type: :"system.message")
        #   A mid-conversation system message event. Carries system-role content that is
        #   appended to the session as a `role: "system"` turn.
        #
        #   @param id [String] Unique identifier for this event.
        #
        #   @param content [Array<Anthropic::Models::Beta::BetaManagedAgentsSystemContentBlock>] System content blocks. Text-only.
        #
        #   @param processed_at [Time, nil] Timestamp when this system message was processed.
        #
        #   @param type [Symbol, :"system.message"]
      end
    end

    BetaManagedAgentsSystemMessageEvent = Beta::BetaManagedAgentsSystemMessageEvent
  end
end
