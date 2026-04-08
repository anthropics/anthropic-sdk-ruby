# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserCustomToolResultEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute custom_tool_use_id
          #   The id of the `agent.custom_tool_use` event this result corresponds to, which
          #   can be found in the last `session.status_idle`
          #   [event's](https://platform.claude.com/docs/en/api/beta/sessions/events/list#beta_managed_agents_session_requires_action.event_ids)
          #   `stop_reason.event_ids` field.
          #
          #   @return [String]
          required :custom_tool_use_id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::Type }

          # @!attribute content
          #   The result content returned by the tool.
          #
          #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock>, nil]
          optional :content,
                   -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::Content] }

          # @!attribute is_error
          #   Whether the tool execution resulted in an error.
          #
          #   @return [Boolean, nil]
          optional :is_error, Anthropic::Internal::Type::Boolean, nil?: true

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time, nil]
          optional :processed_at, Time, nil?: true

          # @!method initialize(id:, custom_tool_use_id:, type:, content: nil, is_error: nil, processed_at: nil)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent}
          #   for more details.
          #
          #   Event sent by the client providing the result of a custom tool execution.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param custom_tool_use_id [String] The id of the `agent.custom_tool_use` event this result corresponds to, which ca
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::Type]
          #
          #   @param content [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock>] The result content returned by the tool.
          #
          #   @param is_error [Boolean, nil] Whether the tool execution resulted in an error.
          #
          #   @param processed_at [Time, nil] A timestamp in RFC 3339 format

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            USER_CUSTOM_TOOL_RESULT = :"user.custom_tool_result"

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
