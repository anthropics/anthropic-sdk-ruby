# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsUserToolResultEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for this event.
        #
        #   @return [String]
        required :id, String

        # @!attribute tool_use_id
        #   The id of the `agent.tool_use` event this result corresponds to, which can be
        #   found in the last `session.status_idle`
        #   [event's](https://platform.claude.com/docs/en/api/beta/sessions/events/list#beta_managed_agents_session_requires_action.event_ids)
        #   `stop_reason.event_ids` field.
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsUserToolResultEvent::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsUserToolResultEvent::Type }

        # @!attribute content
        #   The result content returned by the tool.
        #
        #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultBlock>, nil]
        optional :content,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsUserToolResultEvent::Content] }

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

        # @!attribute session_thread_id
        #   Routes this result to a subagent thread. Copy from the `agent.tool_use` event's
        #   `session_thread_id`.
        #
        #   @return [String, nil]
        optional :session_thread_id, String, nil?: true

        # @!method initialize(id:, tool_use_id:, type:, content: nil, is_error: nil, processed_at: nil, session_thread_id: nil)
        #   Event sent by the client providing the result of an agent-toolset tool
        #   execution. Only valid on `self_hosted` environments, where sandbox-routed tools
        #   are executed by the client rather than the server.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsUserToolResultEvent} for more
        #   details.
        #
        #   @param id [String] Unique identifier for this event.
        #
        #   @param tool_use_id [String] The id of the `agent.tool_use` event this result corresponds to, which can be fo
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsUserToolResultEvent::Type]
        #
        #   @param content [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultBlock>] The result content returned by the tool.
        #
        #   @param is_error [Boolean, nil] Whether the tool execution resulted in an error.
        #
        #   @param processed_at [Time, nil] A timestamp in RFC 3339 format
        #
        #   @param session_thread_id [String, nil] Routes this result to a subagent thread. Copy from the `agent.tool_use` event's

        # @see Anthropic::Models::Beta::BetaManagedAgentsUserToolResultEvent#type
        module Type
          extend Anthropic::Internal::Type::Enum

          USER_TOOL_RESULT = :"user.tool_result"

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

          # A block containing a web search result.
          variant :search_result, -> { Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultBlock }

          module Type
            extend Anthropic::Internal::Type::Enum

            TEXT = :text
            IMAGE = :image
            DOCUMENT = :document
            SEARCH_RESULT = :search_result

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultBlock)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :text The text content.
          #
          #   @option args [Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64ImageSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLImageSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileImageSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64DocumentSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLDocumentSource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileDocumentSource, String] :source Union type for image source variants.
          #
          #   @option args [String, nil] :context Additional context about the document for the model.
          #
          #   @option args [String, nil, String] :title The title of the document.
          #
          #   @option args [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultCitations] :citations Citation settings for a search result.
          #
          #   @option args [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultContent>] :content Array of text content blocks from the search result.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultBlock]
          def self.new(type:, **args)
            case type.to_sym
            when :text
              Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock.new(**args)
            when :image
              Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock.new(**args)
            when :document
              Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock.new(**args)
            when :search_result
              Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultBlock.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaManagedAgentsUserToolResultEvent = Beta::BetaManagedAgentsUserToolResultEvent
  end
end
