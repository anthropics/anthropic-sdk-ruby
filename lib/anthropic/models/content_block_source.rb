# frozen_string_literal: true

module Anthropic
  module Models
    class ContentBlockSource < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [String, Array<Anthropic::TextBlockParam, Anthropic::ImageBlockParam>]
      required :content, union: -> { Anthropic::ContentBlockSource::Content }

      # @!attribute type
      #
      #   @return [Symbol, :content]
      required :type, const: :content

      # @!method initialize(content:, type: :content)
      #   @param content [String, Array<Anthropic::TextBlockParam, Anthropic::ImageBlockParam>]
      #   @param type [Symbol, :content]

      # @see Anthropic::ContentBlockSource#content
      module Content
        extend Anthropic::Internal::Type::Union

        variant String

        variant -> { Anthropic::ContentBlockSource::Content::ContentBlockSourceContentArray }

        # @!method self.variants
        #   @return [Array(String, Array<Anthropic::TextBlockParam, Anthropic::ImageBlockParam>)]

        define_sorbet_constant!(:Variants) do
          T.type_alias do
            T.any(String, T::Array[T.any(Anthropic::TextBlockParam, Anthropic::ImageBlockParam)])
          end
        end

        # @type [Anthropic::Internal::Type::Converter]
        ContentBlockSourceContentArray =
          Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::ContentBlockSourceContent }]
      end
    end
  end
end
