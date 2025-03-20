# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
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

        module Content
          extend Anthropic::Union

          BetaContentBlockSourceContentArray =
            Anthropic::ArrayOf[union: -> { Anthropic::Models::Beta::BetaContentBlockSourceContent }]

          variant String

          variant Anthropic::Models::Beta::BetaContentBlockSource::Content::BetaContentBlockSourceContentArray

          # @!parse
          #   class << self
          #     # @return [Array(String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>)]
          #     def variants; end
          #   end
        end
      end
    end

    BetaContentBlockSource = Beta::BetaContentBlockSource
  end
end
