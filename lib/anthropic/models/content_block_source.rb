# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # content_block_source => {
    #   content: Anthropic::Models::ContentBlockSource::Content,
    #   type: :content
    # }
    # ```
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
      #   # @param type [String]
      #   #
      #   def initialize(content:, type: :content, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # case content
      # in String
      #   # ...
      # in Anthropic::Models::ContentBlockSource::Content::ContentBlockSourceContentArray
      #   # ...
      # end
      # ```
      class Content < Anthropic::Union
        ContentBlockSourceContentArray = Anthropic::ArrayOf[union: -> {
          Anthropic::Models::ContentBlockSourceContent
        }]

        variant String

        variant Anthropic::Models::ContentBlockSource::Content::ContentBlockSourceContentArray
      end
    end
  end
end
