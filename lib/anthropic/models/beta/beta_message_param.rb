# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMessageParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaServerToolUseBlockParam, Anthropic::Models::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaMCPToolUseBlockParam, Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam, Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaBase64PDFBlock, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam, Anthropic::Models::Beta::BetaContainerUploadBlockParam>]
        required :content, union: -> { Anthropic::Beta::BetaMessageParam::Content }

        # @!attribute role
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaMessageParam::Role]
        required :role, enum: -> { Anthropic::Beta::BetaMessageParam::Role }

        # @!method initialize(content:, role:)
        #   @param content [String, Array<Anthropic::Models::Beta::BetaServerToolUseBlockParam, Anthropic::Models::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaMCPToolUseBlockParam, Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam, Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaBase64PDFBlock, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam, Anthropic::Models::Beta::BetaContainerUploadBlockParam>]
        #   @param role [Symbol, Anthropic::Models::Beta::BetaMessageParam::Role]

        # @see Anthropic::Models::Beta::BetaMessageParam#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant String

          variant -> { Anthropic::Models::Beta::BetaMessageParam::Content::BetaContentBlockParamArray }

          # @!method self.variants
          #   @return [Array(String, Array<Anthropic::Models::Beta::BetaServerToolUseBlockParam, Anthropic::Models::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaMCPToolUseBlockParam, Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam, Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaBase64PDFBlock, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam, Anthropic::Models::Beta::BetaContainerUploadBlockParam>)]

          # @type [Anthropic::Internal::Type::Converter]
          BetaContentBlockParamArray =
            Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::Beta::BetaContentBlockParam }]
        end

        # @see Anthropic::Models::Beta::BetaMessageParam#role
        module Role
          extend Anthropic::Internal::Type::Enum

          USER = :user
          ASSISTANT = :assistant

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaMessageParam = Beta::BetaMessageParam
  end
end
