# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentThreadMessageSentEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute content
          #   Message content blocks.
          #
          #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock>]
          required :content,
                   -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent::Content] }

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute to_session_thread_id
          #   Public `sthr_` ID of the thread the message was sent to.
          #
          #   @return [String]
          required :to_session_thread_id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent::Type }

          # @!attribute to_agent_name
          #   Name of the callable agent this message was sent to. Absent when sent to the
          #   primary agent.
          #
          #   @return [String, nil]
          optional :to_agent_name, String, nil?: true

          # @!method initialize(id:, content:, processed_at:, to_session_thread_id:, type:, to_agent_name: nil)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent}
          #   for more details.
          #
          #   Observability event emitted to the sender's output stream when an agent-to-agent
          #   message is sent.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param content [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock>] Message content blocks.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param to_session_thread_id [String] Public `sthr_` ID of the thread the message was sent to.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent::Type]
          #
          #   @param to_agent_name [String, nil] Name of the callable agent this message was sent to. Absent when sent to the pri

          # Content block in a user message. Can be `text`, `image`, or `document`.
          module Content
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Regular text content.
            variant :text, -> { Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock }

            # Image content specified directly as base64 data or as a reference via a URL.
            variant :image, -> { Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock }

            # Document content, either specified directly as base64 data, as text, or as a reference via a URL.
            variant :document, -> { Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock)]
          end

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            AGENT_THREAD_MESSAGE_SENT = :"agent.thread_message_sent"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
