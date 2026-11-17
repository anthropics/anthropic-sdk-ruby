# typed: strong

module Anthropic
  module Models
    BetaContentBlock = Beta::BetaContentBlock

    module Beta
      module BetaContentBlock
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTextBlock,
              Anthropic::Beta::BetaThinkingBlock,
              Anthropic::Beta::BetaRedactedThinkingBlock,
              Anthropic::Beta::BetaToolUseBlock,
              Anthropic::Beta::BetaServerToolUseBlock,
              Anthropic::Beta::BetaWebSearchToolResultBlock,
              Anthropic::Beta::BetaWebFetchToolResultBlock,
              Anthropic::Beta::BetaAdvisorToolResultBlock,
              Anthropic::Beta::BetaCodeExecutionToolResultBlock,
              Anthropic::Beta::BetaBashCodeExecutionToolResultBlock,
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlock,
              Anthropic::Beta::BetaToolSearchToolResultBlock,
              Anthropic::Beta::BetaMCPToolUseBlock,
              Anthropic::Beta::BetaMCPToolResultBlock,
              Anthropic::Beta::BetaContainerUploadBlock,
              Anthropic::Beta::BetaCompactionBlock,
              Anthropic::Beta::BetaFallbackBlock,
              Anthropic::Beta::BetaMCPToolListingBlock
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaContentBlock::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TEXT =
            T.let(:text, Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol)
          THINKING =
            T.let(
              :thinking,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          REDACTED_THINKING =
            T.let(
              :redacted_thinking,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          TOOL_USE =
            T.let(
              :tool_use,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          SERVER_TOOL_USE =
            T.let(
              :server_tool_use,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          WEB_SEARCH_TOOL_RESULT =
            T.let(
              :web_search_tool_result,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          WEB_FETCH_TOOL_RESULT =
            T.let(
              :web_fetch_tool_result,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          ADVISOR_TOOL_RESULT =
            T.let(
              :advisor_tool_result,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          CODE_EXECUTION_TOOL_RESULT =
            T.let(
              :code_execution_tool_result,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          BASH_CODE_EXECUTION_TOOL_RESULT =
            T.let(
              :bash_code_execution_tool_result,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          TEXT_EDITOR_CODE_EXECUTION_TOOL_RESULT =
            T.let(
              :text_editor_code_execution_tool_result,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          TOOL_SEARCH_TOOL_RESULT =
            T.let(
              :tool_search_tool_result,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          MCP_TOOL_USE =
            T.let(
              :mcp_tool_use,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          MCP_TOOL_RESULT =
            T.let(
              :mcp_tool_result,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          CONTAINER_UPLOAD =
            T.let(
              :container_upload,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          COMPACTION =
            T.let(
              :compaction,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          FALLBACK =
            T.let(
              :fallback,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )
          MCP_TOOL_LISTING =
            T.let(
              :mcp_tool_listing,
              Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaContentBlock::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaContentBlock::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: Anthropic::Beta::BetaContentBlock::Type::OrSymbol,
            citations:
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaCitationCharLocation::OrHash,
                    Anthropic::Beta::BetaCitationPageLocation::OrHash,
                    Anthropic::Beta::BetaCitationContentBlockLocation::OrHash,
                    Anthropic::Beta::BetaCitationsWebSearchResultLocation::OrHash,
                    Anthropic::Beta::BetaCitationSearchResultLocation::OrHash
                  )
                ]
              ),
            text: String,
            signature: T.any(String, T.nilable(String)),
            thinking: String,
            data: String,
            id: String,
            input: T::Hash[Symbol, T.anything],
            name:
              T.any(
                String,
                Anthropic::Beta::BetaServerToolUseBlock::Name::OrSymbol
              ),
            caller_:
              T.any(
                Anthropic::Beta::BetaDirectCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller20260120::OrHash
              ),
            toolset_name: T.nilable(String),
            content:
              T.any(
                T.any(
                  Anthropic::Beta::BetaWebSearchToolResultErrorObject::OrHash,
                  T::Array[Anthropic::Beta::BetaWebSearchResultBlock::OrHash]
                ),
                T.any(
                  Anthropic::Beta::BetaWebFetchToolResultErrorBlock::OrHash,
                  Anthropic::Beta::BetaWebFetchBlock::OrHash
                ),
                T.any(
                  Anthropic::Beta::BetaAdvisorToolResultErrorObject::OrHash,
                  Anthropic::Beta::BetaAdvisorResultBlock::OrHash,
                  Anthropic::Beta::BetaAdvisorRedactedResultBlock::OrHash
                ),
                T.any(
                  Anthropic::Beta::BetaCodeExecutionToolResultErrorObject::OrHash,
                  Anthropic::Beta::BetaCodeExecutionResultBlock::OrHash,
                  Anthropic::Beta::BetaEncryptedCodeExecutionResultBlock::OrHash
                ),
                T.any(
                  Anthropic::Beta::BetaBashCodeExecutionToolResultErrorObject::OrHash,
                  Anthropic::Beta::BetaBashCodeExecutionResultBlock::OrHash
                ),
                T.any(
                  Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorObject::OrHash,
                  Anthropic::Beta::BetaTextEditorCodeExecutionViewResultBlock::OrHash,
                  Anthropic::Beta::BetaTextEditorCodeExecutionCreateResultBlock::OrHash,
                  Anthropic::Beta::BetaTextEditorCodeExecutionStrReplaceResultBlock::OrHash
                ),
                T.any(
                  Anthropic::Beta::BetaToolSearchToolResultErrorObject::OrHash,
                  Anthropic::Beta::BetaToolSearchToolSearchResultBlock::OrHash
                ),
                Anthropic::Beta::BetaMCPToolResultBlock::Content::Variants,
                T.nilable(String)
              ),
            tool_use_id: String,
            server_name: String,
            is_error: T::Boolean,
            file_id: String,
            encrypted_content: T.nilable(String),
            tool_changes:
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaResponseToolAdditionBlock::OrHash,
                    Anthropic::Beta::BetaResponseToolRemovalBlock::OrHash
                  )
                ]
              ),
            from: Anthropic::Beta::BetaFallbackInfo::OrHash,
            to: Anthropic::Beta::BetaFallbackInfo::OrHash,
            trigger: Anthropic::Beta::BetaFallbackRefusalTrigger::OrHash,
            mcp_server_name: String,
            tools: T::Array[Anthropic::Beta::BetaMCPTool::OrHash]
          ).returns(Anthropic::Beta::BetaContentBlock::Variants)
        end
        def self.new(
          type:,
          # Citations supporting the text block.
          #
          # The type of citation returned will depend on the type of document being cited.
          # Citing a PDF results in `page_location`, plain text results in `char_location`,
          # and content document results in `content_block_location`.
          citations: nil,
          text: nil,
          # A value used to verify that this thinking block was generated by Claude when it
          # is passed back to the API.
          #
          # This is an opaque field and should not be interpreted or parsed. When passing
          # thinking blocks back to the API (required when using tools with extended
          # thinking), pass them back exactly as received, with this field intact.
          #
          # See
          # [extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking)
          # for details.
          signature: nil,
          # The text of Claude's thinking process for this block.
          thinking: nil,
          # The contents of this redacted thinking block, returned when portions of the
          # model's thinking were safety-redacted. This field is opaque and encrypted, with
          # no readable content.
          #
          # Pass `redacted_thinking` blocks back to the API unchanged when continuing a
          # multi-turn conversation.
          #
          # See
          # [extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking#redacted-thinking-blocks)
          # for details.
          data: nil,
          id: nil,
          input: nil,
          # The name of the MCP tool
          name: nil,
          caller_: nil,
          # For a toolset member tool_use, the toolset family.
          toolset_name: nil,
          # Summary of compacted content, or null if compaction failed
          content: nil,
          tool_use_id: nil,
          # The name of the MCP server
          server_name: nil,
          is_error: nil,
          file_id: nil,
          # Opaque metadata from prior compaction, to be round-tripped verbatim
          encrypted_content: nil,
          # The tool changes of the compacted range: the `tool_addition` and `tool_removal`
          # blocks that take the request's `tools` to the tool set in effect at the end of
          # the range, or `[]` when the range changed no tool. Absent when the server did
          # not compute them. Send the block back unchanged.
          tool_changes: nil,
          # The model whose output ends at this point — the model that declined at this hop.
          # When the declining hop is the requested model, its `model` echoes the top-level
          # `model` string the caller sent (alias or canonical); when the declining hop is a
          # fallback model, its `model` is that model's canonical id.
          from: nil,
          # The fallback model producing the content that follows this block. Its `model` is
          # always the canonical id.
          to: nil,
          # What caused the `from` model to hand over at this hop.
          trigger: nil,
          mcp_server_name: nil,
          tools: nil
        )
        end
      end
    end
  end
end
