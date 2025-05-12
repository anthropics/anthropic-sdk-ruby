# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaContentBlockSource < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [String, Array<Anthropic::Beta::BetaTextBlockParam, Anthropic::Beta::BetaImageBlockParam>]
        required :content, union: -> { Anthropic::Beta::BetaContentBlockSource::Content }

        # @!attribute type
        #
        #   @return [Symbol, :content]
        required :type, const: :content

        # @!method initialize(content:, type: :content)
        #   @param content [String, Array<Anthropic::Beta::BetaTextBlockParam, Anthropic::Beta::BetaImageBlockParam>]
        #   @param type [Symbol, :content]

        # @see Anthropic::Beta::BetaContentBlockSource#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant String

          variant -> { Anthropic::Beta::BetaContentBlockSource::Content::BetaContentBlockSourceContentArray }

          # @!method self.variants
          #   @return [Array(String, Array<Anthropic::Beta::BetaTextBlockParam, Anthropic::Beta::BetaImageBlockParam>)]

          define_sorbet_constant!(:Variants) do
            T.type_alias do
              T.any(
                String,
                T::Array[T.any(
                  Anthropic::Beta::BetaTextBlockParam,
                  Anthropic::Beta::BetaImageBlockParam
                )]
              )
            end
          end

          # @type [Anthropic::Internal::Type::Converter]
          BetaContentBlockSourceContentArray =
            Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::Beta::BetaContentBlockSourceContent }]
        end
      end
    end

    BetaContentBlockSource = Beta::BetaContentBlockSource
  end
end
