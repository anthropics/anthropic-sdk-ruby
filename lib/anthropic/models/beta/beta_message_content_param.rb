# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaMessageContentParam
        extend Anthropic::Internal::Type::Union

        variant String

        variant -> { Anthropic::Models::Beta::BetaMessageContentParam::BetaContentBlockParamArray }

        # @!method self.variants
        #   @return [Array(String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaServerToolUseBlockParam, Anthropic::Models::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Models::Beta::BetaWebFetchToolResultBlockParam, Anthropic::Models::Beta::BetaAdvisorToolResultBlockParam, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaToolSearchToolResultBlockParam, Anthropic::Models::Beta::BetaMCPToolUseBlockParam, Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam, Anthropic::Models::Beta::BetaContainerUploadBlockParam, Anthropic::Models::Beta::BetaCompactionBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock, Anthropic::Models::Beta::BetaMCPToolListingBlockParam, Anthropic::Models::Beta::BetaFallbackBlockParam>)]

        # @type [Anthropic::Internal::Type::Converter]
        BetaContentBlockParamArray =
          Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::Beta::BetaContentBlockParam }]
      end
    end

    BetaMessageContentParam = Beta::BetaMessageContentParam
  end
end
