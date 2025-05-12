# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMessageParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [String, Array<Anthropic::Beta::BetaTextBlockParam, Anthropic::Beta::BetaImageBlockParam, Anthropic::Beta::BetaToolUseBlockParam, Anthropic::Beta::BetaServerToolUseBlockParam, Anthropic::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Beta::BetaToolResultBlockParam, Anthropic::Beta::BetaBase64PDFBlock, Anthropic::Beta::BetaThinkingBlockParam, Anthropic::Beta::BetaRedactedThinkingBlockParam>]
        required :content, union: -> { Anthropic::Beta::BetaMessageParam::Content }

        # @!attribute role
        #
        #   @return [Symbol, Anthropic::Beta::BetaMessageParam::Role]
        required :role, enum: -> { Anthropic::Beta::BetaMessageParam::Role }

        # @!method initialize(content:, role:)
        #   @param content [String, Array<Anthropic::Beta::BetaTextBlockParam, Anthropic::Beta::BetaImageBlockParam, Anthropic::Beta::BetaToolUseBlockParam, Anthropic::Beta::BetaServerToolUseBlockParam, Anthropic::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Beta::BetaToolResultBlockParam, Anthropic::Beta::BetaBase64PDFBlock, Anthropic::Beta::BetaThinkingBlockParam, Anthropic::Beta::BetaRedactedThinkingBlockParam>]
        #   @param role [Symbol, Anthropic::Beta::BetaMessageParam::Role]

        # @see Anthropic::Beta::BetaMessageParam#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant String

          variant -> { Anthropic::Beta::BetaMessageParam::Content::BetaContentBlockParamArray }

          # @!method self.variants
          #   @return [Array(String, Array<Anthropic::Beta::BetaTextBlockParam, Anthropic::Beta::BetaImageBlockParam, Anthropic::Beta::BetaToolUseBlockParam, Anthropic::Beta::BetaServerToolUseBlockParam, Anthropic::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Beta::BetaToolResultBlockParam, Anthropic::Beta::BetaBase64PDFBlock, Anthropic::Beta::BetaThinkingBlockParam, Anthropic::Beta::BetaRedactedThinkingBlockParam>)]

          define_sorbet_constant!(:Variants) do
            T.type_alias do
              T.any(
                String,
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaTextBlockParam,
                    Anthropic::Beta::BetaImageBlockParam,
                    Anthropic::Beta::BetaToolUseBlockParam,
                    Anthropic::Beta::BetaServerToolUseBlockParam,
                    Anthropic::Beta::BetaWebSearchToolResultBlockParam,
                    Anthropic::Beta::BetaToolResultBlockParam,
                    Anthropic::Beta::BetaBase64PDFBlock,
                    Anthropic::Beta::BetaThinkingBlockParam,
                    Anthropic::Beta::BetaRedactedThinkingBlockParam
                  )
                ]
              )
            end
          end

          # @type [Anthropic::Internal::Type::Converter]
          BetaContentBlockParamArray =
            Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::Beta::BetaContentBlockParam }]
        end

        # @see Anthropic::Beta::BetaMessageParam#role
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
