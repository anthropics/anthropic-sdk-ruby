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
          #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRedactedBlock>]
          required :content,
                   -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent::Content] }

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
          #   @param content [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRedactedBlock>] Array of text blocks comprising the agent response.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMessageEvent::Type]

          # Content block in an agent message.
          module Content
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Regular text content.
            variant :text, -> { Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock }

            # Placeholder for content withheld by Anthropic model policy.
            variant :redacted, -> { Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRedactedBlock)]
          end

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
