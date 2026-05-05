# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentThreadMessageReceivedEvent < Anthropic::Internal::Type::BaseModel
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
                   -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent::Content] }

          # @!attribute from_session_thread_id
          #   Public `sthr_` ID of the thread that sent the message.
          #
          #   @return [String]
          required :from_session_thread_id, String

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent::Type }

          # @!attribute from_agent_name
          #   Name of the callable agent this message came from. Absent when received from the
          #   primary agent.
          #
          #   @return [String, nil]
          optional :from_agent_name, String, nil?: true

          # @!method initialize(id:, content:, from_session_thread_id:, processed_at:, type:, from_agent_name: nil)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent}
          #   for more details.
          #
          #   Delivery event written to the target thread's input stream when an
          #   agent-to-agent message arrives.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param content [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock>] Message content blocks.
          #
          #   @param from_session_thread_id [String] Public `sthr_` ID of the thread that sent the message.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent::Type]
          #
          #   @param from_agent_name [String, nil] Name of the callable agent this message came from. Absent when received from the

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

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            AGENT_THREAD_MESSAGE_RECEIVED = :"agent.thread_message_received"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
