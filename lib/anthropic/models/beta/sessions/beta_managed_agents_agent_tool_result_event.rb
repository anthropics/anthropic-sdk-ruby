# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentToolResultEvent < Anthropic::Internal::Type::BaseModel
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

          # @!attribute tool_use_id
          #   The id of the `agent.tool_use` event this result corresponds to.
          #
          #   @return [String]
          required :tool_use_id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent::Type }

          # @!attribute content
          #   The result content returned by the tool.
          #
          #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock>, nil]
          optional :content,
                   -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent::Content] }

          # @!attribute is_error
          #   Whether the tool execution resulted in an error.
          #
          #   @return [Boolean, nil]
          optional :is_error, Anthropic::Internal::Type::Boolean, nil?: true

          # @!method initialize(id:, processed_at:, tool_use_id:, type:, content: nil, is_error: nil)
          #   Event representing the result of an agent tool execution.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param tool_use_id [String] The id of the `agent.tool_use` event this result corresponds to.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent::Type]
          #
          #   @param content [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock>] The result content returned by the tool.
          #
          #   @param is_error [Boolean, nil] Whether the tool execution resulted in an error.

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            AGENT_TOOL_RESULT = :"agent.tool_result"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Content block in a tool result. Can be `text`, `image`, `document`, or
          # `search_result`.
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
        end
      end
    end
  end
end
