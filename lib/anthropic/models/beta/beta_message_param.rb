# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMessageParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaServerToolUseBlockParam, Anthropic::Models::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Models::Beta::BetaWebFetchToolResultBlockParam, Anthropic::Models::Beta::BetaAdvisorToolResultBlockParam, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaToolSearchToolResultBlockParam, Anthropic::Models::Beta::BetaMCPToolUseBlockParam, Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam, Anthropic::Models::Beta::BetaContainerUploadBlockParam, Anthropic::Models::Beta::BetaCompactionBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock, Anthropic::Models::Beta::BetaFallbackBlockParam>]
        required :content, union: -> { Anthropic::Beta::BetaMessageParam::Content }

        # @!attribute role
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaMessageParam::Role]
        required :role, enum: -> { Anthropic::Beta::BetaMessageParam::Role }

        # @!attribute clear_at
        #   How long this system message's text stays in front of the model. `"never"` (the
        #   default) renders it on every request that includes it. `"next_user_message"`
        #   renders it only for the user turn it follows: once a later `role: "user"`
        #   message exists in `messages` the message stays in the array (send it unchanged)
        #   but is no longer shown to the model. Only permitted on `role: "system"`
        #   messages.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaMessageParam::ClearAt, nil]
        optional :clear_at, enum: -> { Anthropic::Beta::BetaMessageParam::ClearAt }, nil?: true

        # @!attribute output_config
        #   Per-message output configuration on a role:"system" input message.
        #
        #   Fields here apply per-turn; `format` remains top-level only. An empty `{}` is
        #   accepted on a message that carries content; a message with neither content nor
        #   output_config fields is rejected.
        #
        #   @return [Anthropic::Models::Beta::BetaSystemMessageOutputConfig, nil]
        optional :output_config, -> { Anthropic::Beta::BetaSystemMessageOutputConfig }, nil?: true

        # @!method initialize(content:, role:, clear_at: nil, output_config: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaMessageParam} for more details.
        #
        #   @param content [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaServerToolUseBlockParam, Anthropic::Models::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Models::Beta::BetaWebFetchToolResultBlockParam, Anthropic::Models::Beta::BetaAdvisorToolResultBlockParam, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaToolSearchToolResultBlockParam, Anthropic::Models::Beta::BetaMCPToolUseBlockParam, Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam, Anthropic::Models::Beta::BetaContainerUploadBlockParam, Anthropic::Models::Beta::BetaCompactionBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock, Anthropic::Models::Beta::BetaFallbackBlockParam>]
        #
        #   @param role [Symbol, Anthropic::Models::Beta::BetaMessageParam::Role]
        #
        #   @param clear_at [Symbol, Anthropic::Models::Beta::BetaMessageParam::ClearAt, nil] How long this system message's text stays in front of the model. `"never"` (the
        #
        #   @param output_config [Anthropic::Models::Beta::BetaSystemMessageOutputConfig, nil] Per-message output configuration on a role:"system" input message.

        # @see Anthropic::Models::Beta::BetaMessageParam#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant String

          variant -> { Anthropic::Models::Beta::BetaMessageParam::Content::BetaContentBlockParamArray }

          # @!method self.variants
          #   @return [Array(String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaServerToolUseBlockParam, Anthropic::Models::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Models::Beta::BetaWebFetchToolResultBlockParam, Anthropic::Models::Beta::BetaAdvisorToolResultBlockParam, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaToolSearchToolResultBlockParam, Anthropic::Models::Beta::BetaMCPToolUseBlockParam, Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam, Anthropic::Models::Beta::BetaContainerUploadBlockParam, Anthropic::Models::Beta::BetaCompactionBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock, Anthropic::Models::Beta::BetaFallbackBlockParam>)]

          # @type [Anthropic::Internal::Type::Converter]
          BetaContentBlockParamArray =
            Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::Beta::BetaContentBlockParam }]
        end

        # @see Anthropic::Models::Beta::BetaMessageParam#role
        module Role
          extend Anthropic::Internal::Type::Enum

          USER = :user
          ASSISTANT = :assistant
          SYSTEM = :system

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # How long this system message's text stays in front of the model. `"never"` (the
        # default) renders it on every request that includes it. `"next_user_message"`
        # renders it only for the user turn it follows: once a later `role: "user"`
        # message exists in `messages` the message stays in the array (send it unchanged)
        # but is no longer shown to the model. Only permitted on `role: "system"`
        # messages.
        #
        # @see Anthropic::Models::Beta::BetaMessageParam#clear_at
        module ClearAt
          extend Anthropic::Internal::Type::Enum

          NEXT_USER_MESSAGE = :next_user_message
          NEVER = :never

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaMessageParam = Beta::BetaMessageParam
  end
end
