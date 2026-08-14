# frozen_string_literal: true

module Anthropic
  module Models
    # Regular text content.
    module ContentBlockParam
      extend Anthropic::Internal::Type::Union

      discriminator :type

      # Regular text content.
      variant :text, -> { Anthropic::TextBlockParam }

      # Image content specified directly as base64 data or as a reference via a URL.
      variant :image, -> { Anthropic::ImageBlockParam }

      # Document content, either specified directly as base64 data, as text, or as a reference via a URL.
      variant :document, -> { Anthropic::DocumentBlockParam }

      # A search result block containing source, title, and content from search operations.
      variant :search_result, -> { Anthropic::SearchResultBlockParam }

      # A block specifying internal thinking by the model.
      variant :thinking, -> { Anthropic::ThinkingBlockParam }

      # A block specifying internal, redacted thinking by the model.
      variant :redacted_thinking, -> { Anthropic::RedactedThinkingBlockParam }

      # A block indicating a tool use by the model.
      variant :tool_use, -> { Anthropic::ToolUseBlockParam }

      # A block specifying the results of a tool use by the model.
      variant :tool_result, -> { Anthropic::ToolResultBlockParam }

      variant :server_tool_use, -> { Anthropic::ServerToolUseBlockParam }

      variant :web_search_tool_result, -> { Anthropic::WebSearchToolResultBlockParam }

      variant :web_fetch_tool_result, -> { Anthropic::WebFetchToolResultBlockParam }

      variant :code_execution_tool_result, -> { Anthropic::CodeExecutionToolResultBlockParam }

      variant :bash_code_execution_tool_result, -> { Anthropic::BashCodeExecutionToolResultBlockParam }

      variant :text_editor_code_execution_tool_result,
              -> { Anthropic::TextEditorCodeExecutionToolResultBlockParam }

      variant :tool_search_tool_result, -> { Anthropic::ToolSearchToolResultBlockParam }

      # A content block that represents a file to be uploaded to the container
      # Files uploaded via this block will be available in the container's input directory.
      variant :container_upload, -> { Anthropic::ContainerUploadBlockParam }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::ServerToolUseBlockParam, Anthropic::Models::WebSearchToolResultBlockParam, Anthropic::Models::WebFetchToolResultBlockParam, Anthropic::Models::CodeExecutionToolResultBlockParam, Anthropic::Models::BashCodeExecutionToolResultBlockParam, Anthropic::Models::TextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::ToolSearchToolResultBlockParam, Anthropic::Models::ContainerUploadBlockParam)]

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::ContentBlockParam} for more details.
      #
      # @param type [Symbol, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [String] :text
      #
      #   @option args [Anthropic::Models::CacheControlEphemeral, nil] :cache_control Create a cache control breakpoint at this content block.
      #
      #   @option args [Array<Anthropic::Models::CitationCharLocationParam, Anthropic::Models::CitationPageLocationParam, Anthropic::Models::CitationContentBlockLocationParam, Anthropic::Models::CitationWebSearchResultLocationParam, Anthropic::Models::CitationSearchResultLocationParam>, nil, Anthropic::Models::CitationsConfigParam, nil, Anthropic::Models::CitationsConfigParam] :citations
      #
      #   @option args [Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource, Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource, Anthropic::Models::URLPDFSource, String] :source
      #
      #   @option args [String, nil] :context
      #
      #   @option args [String, nil, String] :title
      #
      #   @option args [Array<Anthropic::Models::TextBlockParam>, String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ToolReferenceBlockParam>, Array<Anthropic::Models::WebSearchResultBlockParam>, Anthropic::Models::WebSearchToolRequestError, Anthropic::Models::WebFetchToolResultErrorBlockParam, Anthropic::Models::WebFetchBlockParam, Anthropic::Models::CodeExecutionToolResultErrorParam, Anthropic::Models::CodeExecutionResultBlockParam, Anthropic::Models::EncryptedCodeExecutionResultBlockParam, Anthropic::Models::BashCodeExecutionToolResultErrorParam, Anthropic::Models::BashCodeExecutionResultBlockParam, Anthropic::Models::TextEditorCodeExecutionToolResultErrorParam, Anthropic::Models::TextEditorCodeExecutionViewResultBlockParam, Anthropic::Models::TextEditorCodeExecutionCreateResultBlockParam, Anthropic::Models::TextEditorCodeExecutionStrReplaceResultBlockParam, Anthropic::Models::ToolSearchToolResultErrorParam, Anthropic::Models::ToolSearchToolSearchResultBlockParam] :content Code execution result with encrypted stdout for PFC + web_search results.
      #
      #   @option args [String] :signature The `signature` value of this thinking block, exactly as returned by the API in
      #
      #   @option args [String] :thinking The `thinking` text of this block as returned by the API.
      #
      #   @option args [String] :data The `data` value of this redacted thinking block, exactly as returned by the API
      #
      #   @option args [String] :id
      #
      #   @option args [Hash{Symbol=>Object}] :input
      #
      #   @option args [String, Symbol, Anthropic::Models::ServerToolUseBlockParam::Name] :name
      #
      #   @option args [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] :caller_ Tool invocation directly from the model.
      #
      #   @option args [String] :tool_use_id
      #
      #   @option args [Boolean] :is_error
      #
      #   @option args [String] :file_id
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::ServerToolUseBlockParam, Anthropic::Models::WebSearchToolResultBlockParam, Anthropic::Models::WebFetchToolResultBlockParam, Anthropic::Models::CodeExecutionToolResultBlockParam, Anthropic::Models::BashCodeExecutionToolResultBlockParam, Anthropic::Models::TextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::ToolSearchToolResultBlockParam, Anthropic::Models::ContainerUploadBlockParam]
      def self.new(type:, **args)
        case type.to_sym
        when :text
          Anthropic::TextBlockParam.new(**args)
        when :image
          Anthropic::ImageBlockParam.new(**args)
        when :document
          Anthropic::DocumentBlockParam.new(**args)
        when :search_result
          Anthropic::SearchResultBlockParam.new(**args)
        when :thinking
          Anthropic::ThinkingBlockParam.new(**args)
        when :redacted_thinking
          Anthropic::RedactedThinkingBlockParam.new(**args)
        when :tool_use
          Anthropic::ToolUseBlockParam.new(**args)
        when :tool_result
          Anthropic::ToolResultBlockParam.new(**args)
        when :server_tool_use
          Anthropic::ServerToolUseBlockParam.new(**args)
        when :web_search_tool_result
          Anthropic::WebSearchToolResultBlockParam.new(**args)
        when :web_fetch_tool_result
          Anthropic::WebFetchToolResultBlockParam.new(**args)
        when :code_execution_tool_result
          Anthropic::CodeExecutionToolResultBlockParam.new(**args)
        when :bash_code_execution_tool_result
          Anthropic::BashCodeExecutionToolResultBlockParam.new(**args)
        when :text_editor_code_execution_tool_result
          Anthropic::TextEditorCodeExecutionToolResultBlockParam.new(**args)
        when :tool_search_tool_result
          Anthropic::ToolSearchToolResultBlockParam.new(**args)
        when :container_upload
          Anthropic::ContainerUploadBlockParam.new(**args)
        else
          raise ArgumentError, "unknown type: #{type}"
        end
      end
    end
  end
end
