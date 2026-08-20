# frozen_string_literal: true

module Anthropic
  module Models
    class RawContentBlockStartEvent < Anthropic::Internal::Type::BaseModel
      # @!attribute content_block
      #   Response model for a file uploaded to the container.
      #
      #   @return [Anthropic::Models::TextBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ServerToolUseBlock, Anthropic::Models::WebSearchToolResultBlock, Anthropic::Models::WebFetchToolResultBlock, Anthropic::Models::CodeExecutionToolResultBlock, Anthropic::Models::BashCodeExecutionToolResultBlock, Anthropic::Models::TextEditorCodeExecutionToolResultBlock, Anthropic::Models::ToolSearchToolResultBlock, Anthropic::Models::ContainerUploadBlock]
      required :content_block, union: -> { Anthropic::RawContentBlockStartEvent::ContentBlock }

      # @!attribute index
      #
      #   @return [Integer]
      required :index, Integer

      # @!attribute type
      #
      #   @return [Symbol, :content_block_start]
      required :type, const: :content_block_start

      # @!method initialize(content_block:, index:, type: :content_block_start)
      #   @param content_block [Anthropic::Models::TextBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ServerToolUseBlock, Anthropic::Models::WebSearchToolResultBlock, Anthropic::Models::WebFetchToolResultBlock, Anthropic::Models::CodeExecutionToolResultBlock, Anthropic::Models::BashCodeExecutionToolResultBlock, Anthropic::Models::TextEditorCodeExecutionToolResultBlock, Anthropic::Models::ToolSearchToolResultBlock, Anthropic::Models::ContainerUploadBlock] Response model for a file uploaded to the container.
      #
      #   @param index [Integer]
      #
      #   @param type [Symbol, :content_block_start]

      # Response model for a file uploaded to the container.
      #
      # @see Anthropic::Models::RawContentBlockStartEvent#content_block
      module ContentBlock
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :text, -> { Anthropic::TextBlock }

        variant :thinking, -> { Anthropic::ThinkingBlock }

        variant :redacted_thinking, -> { Anthropic::RedactedThinkingBlock }

        variant :tool_use, -> { Anthropic::ToolUseBlock }

        variant :server_tool_use, -> { Anthropic::ServerToolUseBlock }

        variant :web_search_tool_result, -> { Anthropic::WebSearchToolResultBlock }

        variant :web_fetch_tool_result, -> { Anthropic::WebFetchToolResultBlock }

        variant :code_execution_tool_result, -> { Anthropic::CodeExecutionToolResultBlock }

        variant :bash_code_execution_tool_result, -> { Anthropic::BashCodeExecutionToolResultBlock }

        variant :text_editor_code_execution_tool_result, -> { Anthropic::TextEditorCodeExecutionToolResultBlock }

        variant :tool_search_tool_result, -> { Anthropic::ToolSearchToolResultBlock }

        # Response model for a file uploaded to the container.
        variant :container_upload, -> { Anthropic::ContainerUploadBlock }

        module Type
          extend Anthropic::Internal::Type::Enum

          TEXT = :text
          THINKING = :thinking
          REDACTED_THINKING = :redacted_thinking
          TOOL_USE = :tool_use
          SERVER_TOOL_USE = :server_tool_use
          WEB_SEARCH_TOOL_RESULT = :web_search_tool_result
          WEB_FETCH_TOOL_RESULT = :web_fetch_tool_result
          CODE_EXECUTION_TOOL_RESULT = :code_execution_tool_result
          BASH_CODE_EXECUTION_TOOL_RESULT = :bash_code_execution_tool_result
          TEXT_EDITOR_CODE_EXECUTION_TOOL_RESULT = :text_editor_code_execution_tool_result
          TOOL_SEARCH_TOOL_RESULT = :tool_search_tool_result
          CONTAINER_UPLOAD = :container_upload

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::TextBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ServerToolUseBlock, Anthropic::Models::WebSearchToolResultBlock, Anthropic::Models::WebFetchToolResultBlock, Anthropic::Models::CodeExecutionToolResultBlock, Anthropic::Models::BashCodeExecutionToolResultBlock, Anthropic::Models::TextEditorCodeExecutionToolResultBlock, Anthropic::Models::ToolSearchToolResultBlock, Anthropic::Models::ContainerUploadBlock)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::RawContentBlockStartEvent::ContentBlock} for more details.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Array<Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation, Anthropic::Models::CitationsWebSearchResultLocation, Anthropic::Models::CitationsSearchResultLocation>, nil] :citations Citations supporting the text block.
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
        #   @option args [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] :caller_ Tool invocation directly from the model.
        #
        #   @option args [Hash{Symbol=>Object}] :input
        #
        #   @option args [String, Symbol, Anthropic::Models::ServerToolUseBlock::Name] :name
        #
        #   @option args [String, nil] :toolset_name For a toolset member tool_use, the toolset family.
        #
        #   @option args [Anthropic::Models::WebSearchToolResultError, Array<Anthropic::Models::WebSearchResultBlock>, Anthropic::Models::WebFetchToolResultErrorBlock, Anthropic::Models::WebFetchBlock, Anthropic::Models::CodeExecutionToolResultError, Anthropic::Models::CodeExecutionResultBlock, Anthropic::Models::EncryptedCodeExecutionResultBlock, Anthropic::Models::BashCodeExecutionToolResultError, Anthropic::Models::BashCodeExecutionResultBlock, Anthropic::Models::TextEditorCodeExecutionToolResultError, Anthropic::Models::TextEditorCodeExecutionViewResultBlock, Anthropic::Models::TextEditorCodeExecutionCreateResultBlock, Anthropic::Models::TextEditorCodeExecutionStrReplaceResultBlock, Anthropic::Models::ToolSearchToolResultError, Anthropic::Models::ToolSearchToolSearchResultBlock] :content Code execution result with encrypted stdout for PFC + web_search results.
        #
        #   @option args [String] :tool_use_id
        #
        #   @option args [String] :file_id
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::TextBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ServerToolUseBlock, Anthropic::Models::WebSearchToolResultBlock, Anthropic::Models::WebFetchToolResultBlock, Anthropic::Models::CodeExecutionToolResultBlock, Anthropic::Models::BashCodeExecutionToolResultBlock, Anthropic::Models::TextEditorCodeExecutionToolResultBlock, Anthropic::Models::ToolSearchToolResultBlock, Anthropic::Models::ContainerUploadBlock]
        def self.new(type:, **args)
          case type.to_sym
          when :text
            Anthropic::TextBlock.new(**args)
          when :thinking
            Anthropic::ThinkingBlock.new(**args)
          when :redacted_thinking
            Anthropic::RedactedThinkingBlock.new(**args)
          when :tool_use
            Anthropic::ToolUseBlock.new(**args)
          when :server_tool_use
            Anthropic::ServerToolUseBlock.new(**args)
          when :web_search_tool_result
            Anthropic::WebSearchToolResultBlock.new(**args)
          when :web_fetch_tool_result
            Anthropic::WebFetchToolResultBlock.new(**args)
          when :code_execution_tool_result
            Anthropic::CodeExecutionToolResultBlock.new(**args)
          when :bash_code_execution_tool_result
            Anthropic::BashCodeExecutionToolResultBlock.new(**args)
          when :text_editor_code_execution_tool_result
            Anthropic::TextEditorCodeExecutionToolResultBlock.new(**args)
          when :tool_search_tool_result
            Anthropic::ToolSearchToolResultBlock.new(**args)
          when :container_upload
            Anthropic::ContainerUploadBlock.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end
  end
end
