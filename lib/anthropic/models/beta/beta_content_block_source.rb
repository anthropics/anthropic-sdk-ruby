# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_content_block_source => {
      #   content: Anthropic::Models::Beta::BetaContentBlockSource::Content,
      #   type: :content
      # }
      # ```
      class BetaContentBlockSource < Anthropic::BaseModel
        # @!attribute content
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>]
        required :content, union: -> { Anthropic::Models::Beta::BetaContentBlockSource::Content }

        # @!attribute type
        #
        #   @return [Symbol, :content]
        required :type, const: :content

        # @!parse
        #   # @param content [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>]
        #   # @param type [Symbol, :content]
        #   #
        #   def initialize(content:, type: :content, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @abstract
        #
        # @example
        # ```ruby
        # case content
        # in String
        #   # ...
        # in Anthropic::Models::Beta::BetaContentBlockSource::Content::BetaContentBlockSourceContentArray
        #   # ...
        # end
        # ```
        class Content < Anthropic::Union
          BetaContentBlockSourceContentArray = Anthropic::ArrayOf[union: -> { Anthropic::Models::Beta::BetaContentBlockSourceContent }]

          variant String

          variant Anthropic::Models::Beta::BetaContentBlockSource::Content::BetaContentBlockSourceContentArray
        end
      end
    end

    BetaContentBlockSource = Beta::BetaContentBlockSource
  end
end
