# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentMessageEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute content
          #   Array of text blocks comprising the agent response.
          #
          #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock>]
          required :content,
                   -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock] }

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMessageEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent::Type }

          # @!method initialize(id:, content:, processed_at:, type:)
          #   An agent response event in the session conversation.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param content [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock>] Array of text blocks comprising the agent response.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMessageEvent::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMessageEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            AGENT_MESSAGE = :"agent.message"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
