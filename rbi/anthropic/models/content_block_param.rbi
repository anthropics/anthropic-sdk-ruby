# typed: strong

module Anthropic
  module Models
    # Regular text content.
    module ContentBlockParam
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::TextBlockParam,
            Anthropic::ImageBlockParam,
            Anthropic::DocumentBlockParam,
            Anthropic::SearchResultBlockParam,
            Anthropic::ThinkingBlockParam,
            Anthropic::RedactedThinkingBlockParam,
            Anthropic::ToolUseBlockParam,
            Anthropic::ToolResultBlockParam,
            Anthropic::ServerToolUseBlockParam,
            Anthropic::WebSearchToolResultBlockParam,
            Anthropic::WebFetchToolResultBlockParam,
            Anthropic::CodeExecutionToolResultBlockParam,
            Anthropic::BashCodeExecutionToolResultBlockParam,
            Anthropic::TextEditorCodeExecutionToolResultBlockParam,
            Anthropic::ToolSearchToolResultBlockParam,
            Anthropic::ContainerUploadBlockParam
          )
        end

      sig { override.returns(T::Array[Anthropic::ContentBlockParam::Variants]) }
      def self.variants
      end

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(
          type: T.any(Symbol, String),
          text: String,
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          citations:
            T.any(
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::CitationCharLocationParam::OrHash,
                    Anthropic::CitationPageLocationParam::OrHash,
                    Anthropic::CitationContentBlockLocationParam::OrHash,
                    Anthropic::CitationWebSearchResultLocationParam::OrHash,
                    Anthropic::CitationSearchResultLocationParam::OrHash
                  )
                ]
              ),
              T.nilable(Anthropic::CitationsConfigParam::OrHash),
              Anthropic::CitationsConfigParam::OrHash
            ),
          source:
            T.any(
              T.any(
                Anthropic::Base64ImageSource::OrHash,
                Anthropic::URLImageSource::OrHash,
                Anthropic::FileImageSource::OrHash
              ),
              T.any(
                Anthropic::Base64PDFSource::OrHash,
                Anthropic::PlainTextSource::OrHash,
                Anthropic::ContentBlockSource::OrHash,
                Anthropic::URLPDFSource::OrHash,
                Anthropic::FileDocumentSource::OrHash
              ),
              String
            ),
          transformations:
            T.nilable(Anthropic::ImageTransformationsParam::OrHash),
          context: T.nilable(String),
          title: T.any(T.nilable(String), String),
          content:
            T.any(
              T::Array[Anthropic::TextBlockParam::OrHash],
              Anthropic::ToolResultBlockParam::Content::Variants,
              T.any(
                T::Array[Anthropic::WebSearchResultBlockParam::OrHash],
                Anthropic::WebSearchToolRequestError::OrHash
              ),
              T.any(
                Anthropic::WebFetchToolResultErrorBlockParam::OrHash,
                Anthropic::WebFetchBlockParam::OrHash
              ),
              T.any(
                Anthropic::CodeExecutionToolResultErrorParam::OrHash,
                Anthropic::CodeExecutionResultBlockParam::OrHash,
                Anthropic::EncryptedCodeExecutionResultBlockParam::OrHash
              ),
              T.any(
                Anthropic::BashCodeExecutionToolResultErrorParam::OrHash,
                Anthropic::BashCodeExecutionResultBlockParam::OrHash
              ),
              T.any(
                Anthropic::TextEditorCodeExecutionToolResultErrorParam::OrHash,
                Anthropic::TextEditorCodeExecutionViewResultBlockParam::OrHash,
                Anthropic::TextEditorCodeExecutionCreateResultBlockParam::OrHash,
                Anthropic::TextEditorCodeExecutionStrReplaceResultBlockParam::OrHash
              ),
              T.any(
                Anthropic::ToolSearchToolResultErrorParam::OrHash,
                Anthropic::ToolSearchToolSearchResultBlockParam::OrHash
              )
            ),
          signature: String,
          thinking: String,
          data: String,
          id: String,
          input: T::Hash[Symbol, T.anything],
          name:
            T.any(String, Anthropic::ServerToolUseBlockParam::Name::OrSymbol),
          caller_:
            T.any(
              Anthropic::DirectCaller::OrHash,
              Anthropic::ServerToolCaller::OrHash,
              Anthropic::ServerToolCaller20260120::OrHash
            ),
          toolset_name: T.nilable(String),
          tool_use_id: String,
          is_error: T::Boolean,
          file_id: String
        ).returns(Anthropic::ContentBlockParam::Variants)
      end
      def self.new(
        type:,
        text: nil,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        citations: nil,
        source: nil,
        # Configures the transformations the server applies to this image before the model
        # observes it. Each key names a condition the server transforms images for; its
        # value selects the transformation applied. Omitted keys keep their default
        # behavior, and an empty object is equivalent to omitting the field.
        transformations: nil,
        context: nil,
        title: nil,
        # Code execution result with encrypted stdout for PFC + web_search results.
        content: nil,
        # The `signature` value of this thinking block, exactly as returned by the API in
        # a previous response. Used to verify that the block was generated by Claude.
        #
        # Thinking blocks must be passed back unmodified and in their original order; a
        # modified block results in a 400 `invalid_request_error`.
        signature: nil,
        # The `thinking` text of this block as returned by the API.
        thinking: nil,
        # The `data` value of this redacted thinking block, exactly as returned by the API
        # in a previous response. Opaque and encrypted; pass it back unchanged.
        data: nil,
        id: nil,
        input: nil,
        name: nil,
        # Tool invocation directly from the model.
        caller_: nil,
        # For a toolset member tool_use, the toolset family this member belongs to.
        toolset_name: nil,
        tool_use_id: nil,
        is_error: nil,
        file_id: nil
      )
      end
    end
  end
end
