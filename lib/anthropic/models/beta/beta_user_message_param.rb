# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaUserMessageParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaServerToolUseBlockParam, Anthropic::Models::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Models::Beta::BetaWebFetchToolResultBlockParam, Anthropic::Models::Beta::BetaAdvisorToolResultBlockParam, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaToolSearchToolResultBlockParam, Anthropic::Models::Beta::BetaMCPToolUseBlockParam, Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam, Anthropic::Models::Beta::BetaContainerUploadBlockParam, Anthropic::Models::Beta::BetaCompactionBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock, Anthropic::Models::Beta::BetaMCPToolListingBlockParam, Anthropic::Models::Beta::BetaFallbackBlockParam>]
        required :content, union: -> { Anthropic::Beta::BetaMessageContentParam }

        # @!attribute role
        #
        #   @return [Symbol, :user]
        required :role, const: :user

        # @!method initialize(content:, role: :user)
        #   @param content [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaServerToolUseBlockParam, Anthropic::Models::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Models::Beta::BetaWebFetchToolResultBlockParam, Anthropic::Models::Beta::BetaAdvisorToolResultBlockParam, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaToolSearchToolResultBlockParam, Anthropic::Models::Beta::BetaMCPToolUseBlockParam, Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam, Anthropic::Models::Beta::BetaContainerUploadBlockParam, Anthropic::Models::Beta::BetaCompactionBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock, Anthropic::Models::Beta::BetaMCPToolListingBlockParam, Anthropic::Models::Beta::BetaFallbackBlockParam>]
        #   @param role [Symbol, :user]
      end
    end

    BetaUserMessageParam = Beta::BetaUserMessageParam
  end
end
