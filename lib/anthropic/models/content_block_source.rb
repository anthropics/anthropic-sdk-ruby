# frozen_string_literal: true

module Anthropic
  module Models
    class ContentBlockSource < Anthropic::BaseModel
      # @!attribute content
      #
      #   @return [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>]
      required :content, union: -> { Anthropic::Models::ContentBlockSource::Content }

      # @!attribute type
      #
      #   @return [Symbol, :content]
      required :type, const: :content

      # @!parse
      #   # @param content [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>]
      #   # @param type [Symbol, :content]
      #   #
      #   def initialize(content:, type: :content, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @abstract
      class Content < Anthropic::Union
        ContentBlockSourceContentArray =
          Anthropic::ArrayOf[union: -> { Anthropic::Models::ContentBlockSourceContent }]

        variant String

        variant Anthropic::Models::ContentBlockSource::Content::ContentBlockSourceContentArray

        # @!parse
        #   class << self
        #     # @return [Array(String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam>)]
        #     def variants; end
        #   end
      end
    end
  end
end
