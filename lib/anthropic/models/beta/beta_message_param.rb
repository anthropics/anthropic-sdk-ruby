# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMessageParam < Anthropic::BaseModel
        # @!attribute content
        #   @return [Array<Anthropic::Models::Beta::BetaBase64PDFBlock, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam>, String]
        required :content, Anthropic::Unknown

        # @!attribute role
        #   @return [Symbol, Anthropic::Models::Beta::BetaMessageParam::Role]
        required :role, enum: -> { Anthropic::Models::Beta::BetaMessageParam::Role }

        class Role < Anthropic::Enum
          USER = :user
          ASSISTANT = :assistant
        end

        # @!parse
        #   # Create a new instance of BetaMessageParam from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [Array<Object>, String] :content
        #   #   @option data [String] :role
        #   def initialize(data = {}) = super
      end
    end

    BetaMessageParam = Beta::BetaMessageParam
  end
end
