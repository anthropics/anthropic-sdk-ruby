# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    #
    # @example
    # ```ruby
    # case content_block_source_content
    # in {type: "text", text: String, cache_control: Anthropic::Models::CacheControlEphemeral, citations: -> { Anthropic::ArrayOf[union: Anthropic::Models::TextCitationParam] === _1 }}
    #   # Anthropic::Models::TextBlockParam ...
    # in {type: "image", source: Anthropic::Models::ImageBlockParam::Source, cache_control: Anthropic::Models::CacheControlEphemeral}
    #   # Anthropic::Models::ImageBlockParam ...
    # end
    # ```
    #
    # @example
    # ```ruby
    # case content_block_source_content
    # in Anthropic::Models::TextBlockParam
    #   # ...
    # in Anthropic::Models::ImageBlockParam
    #   # ...
    # end
    # ```
    class ContentBlockSourceContent < Anthropic::Union
      discriminator :type

      variant :text, -> { Anthropic::Models::TextBlockParam }

      variant :image, -> { Anthropic::Models::ImageBlockParam }
    end
  end
end
