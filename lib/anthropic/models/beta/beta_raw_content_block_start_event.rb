# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawContentBlockStartEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute content_block
        #   Response model for a file uploaded to the container.
        #
        #   @return [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaServerToolUseBlock, Anthropic::Models::Beta::BetaWebSearchToolResultBlock, Anthropic::Models::Beta::BetaWebFetchToolResultBlock, Anthropic::Models::Beta::BetaAdvisorToolResultBlock, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaToolSearchToolResultBlock, Anthropic::Models::Beta::BetaMCPToolUseBlock, Anthropic::Models::Beta::BetaMCPToolResultBlock, Anthropic::Models::Beta::BetaContainerUploadBlock, Anthropic::Models::Beta::BetaCompactionBlock, Anthropic::Models::Beta::BetaFallbackBlock]
        required :content_block, union: -> { Anthropic::Beta::BetaRawContentBlockStartEvent::ContentBlock }

        # @!attribute index
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #
        #   @return [Symbol, :content_block_start]
        required :type, const: :content_block_start

        # @!method initialize(content_block:, index:, type: :content_block_start)
        #   @param content_block [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaServerToolUseBlock, Anthropic::Models::Beta::BetaWebSearchToolResultBlock, Anthropic::Models::Beta::BetaWebFetchToolResultBlock, Anthropic::Models::Beta::BetaAdvisorToolResultBlock, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaToolSearchToolResultBlock, Anthropic::Models::Beta::BetaMCPToolUseBlock, Anthropic::Models::Beta::BetaMCPToolResultBlock, Anthropic::Models::Beta::BetaContainerUploadBlock, Anthropic::Models::Beta::BetaCompactionBlock, Anthropic::Models::Beta::BetaFallbackBlock] Response model for a file uploaded to the container.
        #
        #   @param index [Integer]
        #
        #   @param type [Symbol, :content_block_start]

        # Response model for a file uploaded to the container.
        #
        # @see Anthropic::Models::Beta::BetaRawContentBlockStartEvent#content_block
        module ContentBlock
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :text, -> { Anthropic::Beta::BetaTextBlock }

          variant :thinking, -> { Anthropic::Beta::BetaThinkingBlock }

          variant :redacted_thinking, -> { Anthropic::Beta::BetaRedactedThinkingBlock }

          variant :tool_use, -> { Anthropic::Beta::BetaToolUseBlock }

          variant :server_tool_use, -> { Anthropic::Beta::BetaServerToolUseBlock }

          variant :web_search_tool_result, -> { Anthropic::Beta::BetaWebSearchToolResultBlock }

          variant :web_fetch_tool_result, -> { Anthropic::Beta::BetaWebFetchToolResultBlock }

          variant :advisor_tool_result, -> { Anthropic::Beta::BetaAdvisorToolResultBlock }

          variant :code_execution_tool_result, -> { Anthropic::Beta::BetaCodeExecutionToolResultBlock }

          variant :bash_code_execution_tool_result, -> { Anthropic::Beta::BetaBashCodeExecutionToolResultBlock }

          variant :text_editor_code_execution_tool_result,
                  -> { Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlock }

          variant :tool_search_tool_result, -> { Anthropic::Beta::BetaToolSearchToolResultBlock }

          variant :mcp_tool_use, -> { Anthropic::Beta::BetaMCPToolUseBlock }

          variant :mcp_tool_result, -> { Anthropic::Beta::BetaMCPToolResultBlock }

          # Response model for a file uploaded to the container.
          variant :container_upload, -> { Anthropic::Beta::BetaContainerUploadBlock }

          # A compaction block returned when autocompact is triggered.
          #
          # When content is None, it indicates the compaction failed to produce a valid
          # summary (e.g., malformed output from the model). Clients may round-trip
          # compaction blocks with null content; the server treats them as no-ops.
          variant :compaction, -> { Anthropic::Beta::BetaCompactionBlock }

          # Marks the point in `content` where one model's output gives way to the next.
          #
          # One block appears per hop where a preceding model actually ran this turn and
          # declined. A turn where no preceding model ran and declined has no such
          # boundary and carries no block — the signal for whether a fallback model
          # served the response is the presence of a `fallback_message` entry in
          # `usage.iterations`, not this block.
          #
          # The block is treated like a server-tool content block for streaming: it
          # arrives via the standard `content_block_start` / `content_block_stop`
          # pair and carries no deltas.
          variant :fallback, -> { Anthropic::Beta::BetaFallbackBlock }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaServerToolUseBlock, Anthropic::Models::Beta::BetaWebSearchToolResultBlock, Anthropic::Models::Beta::BetaWebFetchToolResultBlock, Anthropic::Models::Beta::BetaAdvisorToolResultBlock, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaToolSearchToolResultBlock, Anthropic::Models::Beta::BetaMCPToolUseBlock, Anthropic::Models::Beta::BetaMCPToolResultBlock, Anthropic::Models::Beta::BetaContainerUploadBlock, Anthropic::Models::Beta::BetaCompactionBlock, Anthropic::Models::Beta::BetaFallbackBlock)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::BetaRawContentBlockStartEvent::ContentBlock} for more
          # details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Array<Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation, Anthropic::Models::Beta::BetaCitationsWebSearchResultLocation, Anthropic::Models::Beta::BetaCitationSearchResultLocation>, nil] :citations Citations supporting the text block.
          #
          #   @option args [String] :text
          #
          #   @option args [String] :signature A value used to verify that this thinking block was generated by Claude when it
          #
          #   @option args [String] :thinking The text of Claude's thinking process for this block.
          #
          #   @option args [String] :data The contents of this redacted thinking block, returned when portions of the mode
          #
          #   @option args [String] :id
          #
          #   @option args [Hash{Symbol=>Object}] :input
          #
          #   @option args [String, Symbol, Anthropic::Models::Beta::BetaServerToolUseBlock::Name] :name The name of the MCP tool
          #
          #   @option args [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] :caller_ Tool invocation directly from the model.
          #
          #   @option args [Anthropic::Models::Beta::BetaWebSearchToolResultError, Array<Anthropic::Models::Beta::BetaWebSearchResultBlock>, Anthropic::Models::Beta::BetaWebFetchToolResultErrorBlock, Anthropic::Models::Beta::BetaWebFetchBlock, Anthropic::Models::Beta::BetaAdvisorToolResultError, Anthropic::Models::Beta::BetaAdvisorResultBlock, Anthropic::Models::Beta::BetaAdvisorRedactedResultBlock, Anthropic::Models::Beta::BetaCodeExecutionToolResultError, Anthropic::Models::Beta::BetaCodeExecutionResultBlock, Anthropic::Models::Beta::BetaEncryptedCodeExecutionResultBlock, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultError, Anthropic::Models::Beta::BetaBashCodeExecutionResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultError, Anthropic::Models::Beta::BetaTextEditorCodeExecutionViewResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionCreateResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlock, Anthropic::Models::Beta::BetaToolSearchToolResultError, Anthropic::Models::Beta::BetaToolSearchToolSearchResultBlock, String, Array<Anthropic::Models::Beta::BetaTextBlock>, String, nil] :content Code execution result with encrypted stdout for PFC + web_search results.
          #
          #   @option args [String] :tool_use_id
          #
          #   @option args [String] :server_name The name of the MCP server
          #
          #   @option args [Boolean] :is_error
          #
          #   @option args [String] :file_id
          #
          #   @option args [String, nil] :encrypted_content Opaque metadata from prior compaction, to be round-tripped verbatim
          #
          #   @option args [Anthropic::Models::Beta::BetaFallbackInfo] :from The model whose output ends at this point — the model that declined at this hop.
          #
          #   @option args [Anthropic::Models::Beta::BetaFallbackInfo] :to The fallback model producing the content that follows this block. Its `model` is
          #
          #   @option args [Anthropic::Models::Beta::BetaFallbackRefusalTrigger] :trigger What caused the `from` model to hand over at this hop.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaServerToolUseBlock, Anthropic::Models::Beta::BetaWebSearchToolResultBlock, Anthropic::Models::Beta::BetaWebFetchToolResultBlock, Anthropic::Models::Beta::BetaAdvisorToolResultBlock, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaToolSearchToolResultBlock, Anthropic::Models::Beta::BetaMCPToolUseBlock, Anthropic::Models::Beta::BetaMCPToolResultBlock, Anthropic::Models::Beta::BetaContainerUploadBlock, Anthropic::Models::Beta::BetaCompactionBlock, Anthropic::Models::Beta::BetaFallbackBlock]
          def self.new(type:, **args)
            case type.to_sym
            when :text
              Anthropic::Beta::BetaTextBlock.new(**args)
            when :thinking
              Anthropic::Beta::BetaThinkingBlock.new(**args)
            when :redacted_thinking
              Anthropic::Beta::BetaRedactedThinkingBlock.new(**args)
            when :tool_use
              Anthropic::Beta::BetaToolUseBlock.new(**args)
            when :server_tool_use
              Anthropic::Beta::BetaServerToolUseBlock.new(**args)
            when :web_search_tool_result
              Anthropic::Beta::BetaWebSearchToolResultBlock.new(**args)
            when :web_fetch_tool_result
              Anthropic::Beta::BetaWebFetchToolResultBlock.new(**args)
            when :advisor_tool_result
              Anthropic::Beta::BetaAdvisorToolResultBlock.new(**args)
            when :code_execution_tool_result
              Anthropic::Beta::BetaCodeExecutionToolResultBlock.new(**args)
            when :bash_code_execution_tool_result
              Anthropic::Beta::BetaBashCodeExecutionToolResultBlock.new(**args)
            when :text_editor_code_execution_tool_result
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlock.new(**args)
            when :tool_search_tool_result
              Anthropic::Beta::BetaToolSearchToolResultBlock.new(**args)
            when :mcp_tool_use
              Anthropic::Beta::BetaMCPToolUseBlock.new(**args)
            when :mcp_tool_result
              Anthropic::Beta::BetaMCPToolResultBlock.new(**args)
            when :container_upload
              Anthropic::Beta::BetaContainerUploadBlock.new(**args)
            when :compaction
              Anthropic::Beta::BetaCompactionBlock.new(**args)
            when :fallback
              Anthropic::Beta::BetaFallbackBlock.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaRawContentBlockStartEvent = Beta::BetaRawContentBlockStartEvent
  end
end
