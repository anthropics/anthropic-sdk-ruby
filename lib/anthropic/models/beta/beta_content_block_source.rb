# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaContentBlockSource < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>]
        required :content, union: -> { Anthropic::Beta::BetaContentBlockSource::Content }

        # @!attribute type
        #
        #   @return [Symbol, :content]
        required :type, const: :content

        # @!method initialize(content:, type: :content)
        #   @param content [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>]
        #   @param type [Symbol, :content]

        # @see Anthropic::Models::Beta::BetaContentBlockSource#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant String

          variant -> { Anthropic::Models::Beta::BetaContentBlockSource::Content::BetaContentBlockSourceContentArray }

          # @!method self.variants
          #   @return [Array(String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>)]

          # @type [Anthropic::Internal::Type::Converter]
          BetaContentBlockSourceContentArray =
            Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::Beta::BetaContentBlockSourceContent }]
        end
      end
    end

    BetaContentBlockSource = Beta::BetaContentBlockSource
  end
end
