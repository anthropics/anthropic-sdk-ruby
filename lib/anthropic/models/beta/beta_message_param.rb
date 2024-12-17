# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMessageParam < Anthropic::BaseModel
        # @!attribute content
        #
        #   @return [Array<Anthropic::Models::Beta::BetaBase64PDFBlock, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam>, String]
        required :content, Anthropic::Unknown

        # @!attribute role
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaMessageParam::Role]
        required :role, enum: -> { Anthropic::Models::Beta::BetaMessageParam::Role }

        # @!parse
        #   # @param content [Array<Anthropic::Models::Beta::BetaBase64PDFBlock, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam>, String]
        #   # @param role [String]
        #   #
        #   def initialize(content:, role:) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case enum
        # in :user
        #   # ...
        # in :assistant
        #   # ...
        # end
        # ```
        class Role < Anthropic::Enum
          USER = :user
          ASSISTANT = :assistant
        end
      end
    end

    BetaMessageParam = Beta::BetaMessageParam
  end
end
