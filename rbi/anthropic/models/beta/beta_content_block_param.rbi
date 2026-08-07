# typed: strong

module Anthropic
  module Models
    BetaContentBlockParam = Beta::BetaContentBlockParam

    module Beta
      # Regular text content.
      module BetaContentBlockParam
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTextBlockParam,
              Anthropic::Beta::BetaImageBlockParam,
              Anthropic::Beta::BetaRequestDocumentBlock,
              Anthropic::Beta::BetaSearchResultBlockParam,
              Anthropic::Beta::BetaThinkingBlockParam,
              Anthropic::Beta::BetaRedactedThinkingBlockParam,
              Anthropic::Beta::BetaToolUseBlockParam,
              Anthropic::Beta::BetaToolResultBlockParam,
              Anthropic::Beta::BetaServerToolUseBlockParam,
              Anthropic::Beta::BetaWebSearchToolResultBlockParam,
              Anthropic::Beta::BetaWebFetchToolResultBlockParam,
              Anthropic::Beta::BetaAdvisorToolResultBlockParam,
              Anthropic::Beta::BetaCodeExecutionToolResultBlockParam,
              Anthropic::Beta::BetaBashCodeExecutionToolResultBlockParam,
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlockParam,
              Anthropic::Beta::BetaToolSearchToolResultBlockParam,
              Anthropic::Beta::BetaMCPToolUseBlockParam,
              Anthropic::Beta::BetaRequestMCPToolResultBlockParam,
              Anthropic::Beta::BetaContainerUploadBlockParam,
              Anthropic::Beta::BetaCompactionBlockParam,
              Anthropic::Beta::BetaMidConversationSystemBlockParam,
              Anthropic::Beta::BetaRequestToolAdditionBlock,
              Anthropic::Beta::BetaRequestToolRemovalBlock,
              Anthropic::Beta::BetaFallbackBlockParam
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaContentBlockParam::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            text: String,
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            citations:
              T.any(
                T.nilable(
                  T::Array[
                    T.any(
                      Anthropic::Beta::BetaCitationCharLocationParam::OrHash,
                      Anthropic::Beta::BetaCitationPageLocationParam::OrHash,
                      Anthropic::Beta::BetaCitationContentBlockLocationParam::OrHash,
                      Anthropic::Beta::BetaCitationWebSearchResultLocationParam::OrHash,
                      Anthropic::Beta::BetaCitationSearchResultLocationParam::OrHash
                    )
                  ]
                ),
                T.nilable(Anthropic::Beta::BetaCitationsConfigParam::OrHash),
                Anthropic::Beta::BetaCitationsConfigParam::OrHash
              ),
            source:
              T.any(
                T.any(
                  Anthropic::Beta::BetaBase64ImageSource::OrHash,
                  Anthropic::Beta::BetaURLImageSource::OrHash,
                  Anthropic::Beta::BetaFileImageSource::OrHash
                ),
                T.any(
                  Anthropic::Beta::BetaBase64PDFSource::OrHash,
                  Anthropic::Beta::BetaPlainTextSource::OrHash,
                  Anthropic::Beta::BetaContentBlockSource::OrHash,
                  Anthropic::Beta::BetaURLPDFSource::OrHash,
                  Anthropic::Beta::BetaFileDocumentSource::OrHash
                ),
                String
              ),
            context: T.nilable(String),
            title: T.any(T.nilable(String), String),
            content:
              T.any(
                T::Array[Anthropic::Beta::BetaTextBlockParam::OrHash],
                Anthropic::Beta::BetaToolResultBlockParam::Content::Variants,
                T.any(
                  T::Array[
                    Anthropic::Beta::BetaWebSearchResultBlockParam::OrHash
                  ],
                  Anthropic::Beta::BetaWebSearchToolRequestError::OrHash
                ),
                T.any(
                  Anthropic::Beta::BetaWebFetchToolResultErrorBlockParam::OrHash,
                  Anthropic::Beta::BetaWebFetchBlockParam::OrHash
                ),
                T.any(
                  Anthropic::Beta::BetaAdvisorToolResultErrorParam::OrHash,
                  Anthropic::Beta::BetaAdvisorResultBlockParam::OrHash,
                  Anthropic::Beta::BetaAdvisorRedactedResultBlockParam::OrHash
                ),
                T.any(
                  Anthropic::Beta::BetaCodeExecutionToolResultErrorParam::OrHash,
                  Anthropic::Beta::BetaCodeExecutionResultBlockParam::OrHash,
                  Anthropic::Beta::BetaEncryptedCodeExecutionResultBlockParam::OrHash
                ),
                T.any(
                  Anthropic::Beta::BetaBashCodeExecutionToolResultErrorParam::OrHash,
                  Anthropic::Beta::BetaBashCodeExecutionResultBlockParam::OrHash
                ),
                T.any(
                  Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam::OrHash,
                  Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlockParam::OrHash,
                  Anthropic::Beta::BetaTextEditorCodeExecutionCreateResultBlockParam::OrHash,
                  Anthropic::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlockParam::OrHash
                ),
                T.any(
                  Anthropic::Beta::BetaToolSearchToolResultErrorParam::OrHash,
                  Anthropic::Beta::BetaToolSearchToolSearchResultBlockParam::OrHash
                ),
                Anthropic::Beta::BetaRequestMCPToolResultBlockParam::Content::Variants,
                T.nilable(String),
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaTextBlockParam::OrHash,
                    Anthropic::Beta::BetaRequestToolAdditionBlock::OrHash,
                    Anthropic::Beta::BetaRequestToolRemovalBlock::OrHash
                  )
                ]
              ),
            signature: String,
            thinking: String,
            data: String,
            id: String,
            input: T::Hash[Symbol, T.anything],
            name:
              T.any(
                String,
                Anthropic::Beta::BetaServerToolUseBlockParam::Name::OrSymbol
              ),
            caller_:
              T.any(
                Anthropic::Beta::BetaDirectCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller20260120::OrHash
              ),
            tool_use_id: String,
            is_error: T::Boolean,
            server_name: String,
            file_id: String,
            encrypted_content: T.nilable(String),
            tool:
              T.any(
                Anthropic::Beta::BetaToolChangeToolReference::OrHash,
                Anthropic::Beta::BetaToolChangeMCPToolReference::OrHash,
                Anthropic::Beta::BetaToolChangeMCPToolsetReference::OrHash
              ),
            from: Anthropic::Beta::BetaFallbackInfoParam::OrHash,
            to: Anthropic::Beta::BetaFallbackInfoParam::OrHash,
            trigger: T.anything
          ).returns(Anthropic::Beta::BetaContentBlockParam::Variants)
        end
        def self.new(
          type:,
          text: nil,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          citations: nil,
          source: nil,
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
          tool_use_id: nil,
          is_error: nil,
          # The name of the MCP server
          server_name: nil,
          file_id: nil,
          # Opaque metadata from prior compaction, to be round-tripped verbatim
          encrypted_content: nil,
          # Reference to a single tool the caller declared directly in `tools[]`. Does not
          # accept the composed `{server}_{name}` form the server assigns to MCP-resolved
          # tools — use `mcp_tool_reference` or `mcp_toolset_reference` for those.
          tool: nil,
          # Identifies one hop of a fallback transition.
          from: nil,
          # Identifies one hop of a fallback transition.
          to: nil,
          # The response block's `trigger`, echoed verbatim. Accepted and ignored by the
          # server; any object or `null` is allowed.
          trigger: nil
        )
        end
      end
    end
  end
end
