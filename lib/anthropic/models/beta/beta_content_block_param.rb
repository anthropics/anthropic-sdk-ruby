# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Regular text content.
      module BetaContentBlockParam
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # Regular text content.
        variant :text, -> { Anthropic::Beta::BetaTextBlockParam }

        # Image content specified directly as base64 data or as a reference via a URL.
        variant :image, -> { Anthropic::Beta::BetaImageBlockParam }

        # Document content, either specified directly as base64 data, as text, or as a reference via a URL.
        variant :document, -> { Anthropic::Beta::BetaRequestDocumentBlock }

        # A search result block containing source, title, and content from search operations.
        variant :search_result, -> { Anthropic::Beta::BetaSearchResultBlockParam }

        # A block specifying internal thinking by the model.
        variant :thinking, -> { Anthropic::Beta::BetaThinkingBlockParam }

        # A block specifying internal, redacted thinking by the model.
        variant :redacted_thinking, -> { Anthropic::Beta::BetaRedactedThinkingBlockParam }

        # A block indicating a tool use by the model.
        variant :tool_use, -> { Anthropic::Beta::BetaToolUseBlockParam }

        # A block specifying the results of a tool use by the model.
        variant :tool_result, -> { Anthropic::Beta::BetaToolResultBlockParam }

        variant :server_tool_use, -> { Anthropic::Beta::BetaServerToolUseBlockParam }

        variant :web_search_tool_result, -> { Anthropic::Beta::BetaWebSearchToolResultBlockParam }

        variant :web_fetch_tool_result, -> { Anthropic::Beta::BetaWebFetchToolResultBlockParam }

        variant :advisor_tool_result, -> { Anthropic::Beta::BetaAdvisorToolResultBlockParam }

        variant :code_execution_tool_result, -> { Anthropic::Beta::BetaCodeExecutionToolResultBlockParam }

        variant :bash_code_execution_tool_result,
                -> { Anthropic::Beta::BetaBashCodeExecutionToolResultBlockParam }

        variant :text_editor_code_execution_tool_result,
                -> { Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlockParam }

        variant :tool_search_tool_result, -> { Anthropic::Beta::BetaToolSearchToolResultBlockParam }

        variant :mcp_tool_use, -> { Anthropic::Beta::BetaMCPToolUseBlockParam }

        variant :mcp_tool_result, -> { Anthropic::Beta::BetaRequestMCPToolResultBlockParam }

        # A content block that represents a file to be uploaded to the container
        # Files uploaded via this block will be available in the container's input directory.
        variant :container_upload, -> { Anthropic::Beta::BetaContainerUploadBlockParam }

        # A compaction block containing summary of previous context.
        #
        # Users should round-trip these blocks from responses to subsequent requests
        # to maintain context across compaction boundaries.
        #
        # When content is None, the block represents a failed compaction. The server
        # treats these as no-ops. Empty string content is not allowed.
        variant :compaction, -> { Anthropic::Beta::BetaCompactionBlockParam }

        # Mid-conversation directive to surface a declared tool.
        #
        # ``tool`` references a tool (or MCP toolset) by name from the request's
        # ``tools``; it is offered to the model from this point in the
        # conversation onward.
        variant :tool_addition, -> { Anthropic::Beta::BetaRequestToolAdditionBlock }

        # Mid-conversation directive to withdraw a tool.
        #
        # ``tool`` references a tool (or MCP toolset) by name from the request's
        # ``tools``; it is no longer offered to the model from this point in the
        # conversation onward.
        variant :tool_removal, -> { Anthropic::Beta::BetaRequestToolRemovalBlock }

        # A `fallback` block echoed back from a prior response.
        #
        # Accepted in `messages[].content` and not rendered into the prompt; not
        # validated against the request's `fallbacks` chain or top-level `model`.
        #
        # Echo the assistant turn back verbatim, including this block in its
        # original position. The block marks the boundary between content produced
        # before and after a fallback hop, and the server relies on that boundary
        # to validate the turn: when thinking runs flank the boundary, omitting
        # the block merges them into one span the server cannot validate (the
        # request is rejected), and moving it into the middle of a single run is
        # likewise rejected; between non-thinking blocks the block's placement has
        # no validation effect.
        variant :fallback, -> { Anthropic::Beta::BetaFallbackBlockParam }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaServerToolUseBlockParam, Anthropic::Models::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Models::Beta::BetaWebFetchToolResultBlockParam, Anthropic::Models::Beta::BetaAdvisorToolResultBlockParam, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaToolSearchToolResultBlockParam, Anthropic::Models::Beta::BetaMCPToolUseBlockParam, Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam, Anthropic::Models::Beta::BetaContainerUploadBlockParam, Anthropic::Models::Beta::BetaCompactionBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock, Anthropic::Models::Beta::BetaFallbackBlockParam)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaContentBlockParam} for more details.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :text
        #
        #   @option args [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] :cache_control Create a cache control breakpoint at this content block.
        #
        #   @option args [Array<Anthropic::Models::Beta::BetaCitationCharLocationParam, Anthropic::Models::Beta::BetaCitationPageLocationParam, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam, Anthropic::Models::Beta::BetaCitationWebSearchResultLocationParam, Anthropic::Models::Beta::BetaCitationSearchResultLocationParam>, nil, Anthropic::Models::Beta::BetaCitationsConfigParam, nil, Anthropic::Models::Beta::BetaCitationsConfigParam] :citations
        #
        #   @option args [Anthropic::Models::Beta::BetaBase64ImageSource, Anthropic::Models::Beta::BetaURLImageSource, Anthropic::Models::Beta::BetaFileImageSource, Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource, Anthropic::Models::Beta::BetaContentBlockSource, Anthropic::Models::Beta::BetaURLPDFSource, Anthropic::Models::Beta::BetaFileDocumentSource, String] :source
        #
        #   @option args [Anthropic::Models::Beta::BetaImageTransformationsParam, nil] :transformations Configures the transformations the server applies to this image before the model
        #
        #   @option args [String, nil] :context
        #
        #   @option args [String, nil, String] :title
        #
        #   @option args [Array<Anthropic::Models::Beta::BetaTextBlockParam>, String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaToolReferenceBlockParam, Anthropic::Models::Beta::BetaBrowserStateBlockParam>, Array<Anthropic::Models::Beta::BetaWebSearchResultBlockParam>, Anthropic::Models::Beta::BetaWebSearchToolRequestError, Anthropic::Models::Beta::BetaWebFetchToolResultErrorBlockParam, Anthropic::Models::Beta::BetaWebFetchBlockParam, Anthropic::Models::Beta::BetaAdvisorToolResultErrorParam, Anthropic::Models::Beta::BetaAdvisorResultBlockParam, Anthropic::Models::Beta::BetaAdvisorRedactedResultBlockParam, Anthropic::Models::Beta::BetaCodeExecutionToolResultErrorParam, Anthropic::Models::Beta::BetaCodeExecutionResultBlockParam, Anthropic::Models::Beta::BetaEncryptedCodeExecutionResultBlockParam, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultErrorParam, Anthropic::Models::Beta::BetaBashCodeExecutionResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultErrorParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionViewResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionCreateResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlockParam, Anthropic::Models::Beta::BetaToolSearchToolResultErrorParam, Anthropic::Models::Beta::BetaToolSearchToolSearchResultBlockParam, String, Array<Anthropic::Models::Beta::BetaTextBlockParam>, String, nil] :content Code execution result with encrypted stdout for PFC + web_search results.
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
        #   @option args [String, Symbol, Anthropic::Models::Beta::BetaServerToolUseBlockParam::Name] :name
        #
        #   @option args [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] :caller_ Tool invocation directly from the model.
        #
        #   @option args [String, nil] :toolset_name For a toolset member tool_use, the toolset family this member belongs to.
        #
        #   @option args [String] :tool_use_id
        #
        #   @option args [Boolean] :is_error
        #
        #   @option args [String] :server_name The name of the MCP server
        #
        #   @option args [String] :file_id
        #
        #   @option args [String, nil] :encrypted_content Opaque metadata from prior compaction, to be round-tripped verbatim
        #
        #   @option args [Anthropic::Models::Beta::BetaToolChangeToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolsetReference] :tool Reference to a single tool the caller declared directly in
        #
        #   @option args [Anthropic::Models::Beta::BetaFallbackInfoParam] :from Identifies one hop of a fallback transition.
        #
        #   @option args [Anthropic::Models::Beta::BetaFallbackInfoParam] :to Identifies one hop of a fallback transition.
        #
        #   @option args [Object] :trigger The response block's `trigger`, echoed verbatim. Accepted and ignored by the ser
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaServerToolUseBlockParam, Anthropic::Models::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Models::Beta::BetaWebFetchToolResultBlockParam, Anthropic::Models::Beta::BetaAdvisorToolResultBlockParam, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaToolSearchToolResultBlockParam, Anthropic::Models::Beta::BetaMCPToolUseBlockParam, Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam, Anthropic::Models::Beta::BetaContainerUploadBlockParam, Anthropic::Models::Beta::BetaCompactionBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock, Anthropic::Models::Beta::BetaFallbackBlockParam]
        def self.new(type:, **args)
          case type.to_sym
          when :text
            Anthropic::Beta::BetaTextBlockParam.new(**args)
          when :image
            Anthropic::Beta::BetaImageBlockParam.new(**args)
          when :document
            Anthropic::Beta::BetaRequestDocumentBlock.new(**args)
          when :search_result
            Anthropic::Beta::BetaSearchResultBlockParam.new(**args)
          when :thinking
            Anthropic::Beta::BetaThinkingBlockParam.new(**args)
          when :redacted_thinking
            Anthropic::Beta::BetaRedactedThinkingBlockParam.new(**args)
          when :tool_use
            Anthropic::Beta::BetaToolUseBlockParam.new(**args)
          when :tool_result
            Anthropic::Beta::BetaToolResultBlockParam.new(**args)
          when :server_tool_use
            Anthropic::Beta::BetaServerToolUseBlockParam.new(**args)
          when :web_search_tool_result
            Anthropic::Beta::BetaWebSearchToolResultBlockParam.new(**args)
          when :web_fetch_tool_result
            Anthropic::Beta::BetaWebFetchToolResultBlockParam.new(**args)
          when :advisor_tool_result
            Anthropic::Beta::BetaAdvisorToolResultBlockParam.new(**args)
          when :code_execution_tool_result
            Anthropic::Beta::BetaCodeExecutionToolResultBlockParam.new(**args)
          when :bash_code_execution_tool_result
            Anthropic::Beta::BetaBashCodeExecutionToolResultBlockParam.new(**args)
          when :text_editor_code_execution_tool_result
            Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlockParam.new(**args)
          when :tool_search_tool_result
            Anthropic::Beta::BetaToolSearchToolResultBlockParam.new(**args)
          when :mcp_tool_use
            Anthropic::Beta::BetaMCPToolUseBlockParam.new(**args)
          when :mcp_tool_result
            Anthropic::Beta::BetaRequestMCPToolResultBlockParam.new(**args)
          when :container_upload
            Anthropic::Beta::BetaContainerUploadBlockParam.new(**args)
          when :compaction
            Anthropic::Beta::BetaCompactionBlockParam.new(**args)
          when :tool_addition
            Anthropic::Beta::BetaRequestToolAdditionBlock.new(**args)
          when :tool_removal
            Anthropic::Beta::BetaRequestToolRemovalBlock.new(**args)
          when :fallback
            Anthropic::Beta::BetaFallbackBlockParam.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaContentBlockParam = Beta::BetaContentBlockParam
  end
end
