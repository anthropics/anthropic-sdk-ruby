# frozen_string_literal: true

module Anthropic
  module Models
    class ContentBlockSource < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>]
      required :content, union: -> { Anthropic::ContentBlockSource::Content }

      # @!attribute type
      #
      #   @return [Symbol, :content]
      required :type, const: :content

      # @!method initialize(content:, type: :content)
      #   @param content [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>]
      #   @param type [Symbol, :content]

      # @see Anthropic::Models::ContentBlockSource#content
      module Content
        extend Anthropic::Internal::Type::Union

        variant String

        variant -> { Anthropic::Models::ContentBlockSource::Content::ContentBlockSourceContentArray }

        # @!method self.variants
        #   @return [Array(String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>)]

        # @type [Anthropic::Internal::Type::Converter]
        ContentBlockSourceContentArray =
          Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::ContentBlockSourceContent }]
      end
    end
  end
end
