# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMessageParam < Anthropic::BaseModel
        # @!attribute content
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaBase64PDFBlock, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam>]
        required :content, union: -> { Anthropic::Models::Beta::BetaMessageParam::Content }

        # @!attribute role
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaMessageParam::Role]
        required :role, enum: -> { Anthropic::Models::Beta::BetaMessageParam::Role }

        # @!parse
        #   # @param content [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaBase64PDFBlock, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam>]
        #   # @param role [Symbol, Anthropic::Models::Beta::BetaMessageParam::Role]
        #   #
        #   def initialize(content:, role:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        module Content
          extend Anthropic::Union

          BetaContentBlockParamArray =
            Anthropic::ArrayOf[union: -> { Anthropic::Models::Beta::BetaContentBlockParam }]

          variant String

          variant Anthropic::Models::Beta::BetaMessageParam::Content::BetaContentBlockParamArray

          # @!parse
          #   class << self
          #     # @return [Array(String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaBase64PDFBlock, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam>)]
          #     def variants; end
          #   end
        end

        module Role
          extend Anthropic::Enum

          USER = :user
          ASSISTANT = :assistant

          finalize!

          class << self
            # @!parse
            #   # @return [Array<Symbol>]
            #   def values; end
          end
        end
      end
    end

    BetaMessageParam = Beta::BetaMessageParam
  end
end
