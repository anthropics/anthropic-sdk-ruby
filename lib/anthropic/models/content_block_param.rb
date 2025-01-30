# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    #
    # @example
    # ```ruby
    # case content_block_param
    # in {type: "text", text: String, cache_control: Anthropic::Models::CacheControlEphemeral, citations: -> { Anthropic::ArrayOf[union: Anthropic::Models::TextCitationParam] === _1 }}
    #   # Anthropic::Models::TextBlockParam ...
    # in {type: "image", source: Anthropic::Models::ImageBlockParam::Source, cache_control: Anthropic::Models::CacheControlEphemeral}
    #   # Anthropic::Models::ImageBlockParam ...
    # in {type: "tool_use", id: String, input: Anthropic::Unknown, name: String}
    #   # Anthropic::Models::ToolUseBlockParam ...
    # in {type: "tool_result", tool_use_id: String, cache_control: Anthropic::Models::CacheControlEphemeral, content: Anthropic::Models::ToolResultBlockParam::Content}
    #   # Anthropic::Models::ToolResultBlockParam ...
    # in {type: "document", source: Anthropic::Models::DocumentBlockParam::Source, cache_control: Anthropic::Models::CacheControlEphemeral, citations: Anthropic::Models::CitationsConfigParam}
    #   # Anthropic::Models::DocumentBlockParam ...
    # end
    # ```
    #
    # @example
    # ```ruby
    # case content_block_param
    # in Anthropic::Models::TextBlockParam
    #   # ...
    # in Anthropic::Models::ImageBlockParam
    #   # ...
    # in Anthropic::Models::ToolUseBlockParam
    #   # ...
    # in Anthropic::Models::ToolResultBlockParam
    #   # ...
    # in Anthropic::Models::DocumentBlockParam
    #   # ...
    # end
    # ```
    class ContentBlockParam < Anthropic::Union
      discriminator :type

      variant :text, -> { Anthropic::Models::TextBlockParam }

      variant :image, -> { Anthropic::Models::ImageBlockParam }

      variant :tool_use, -> { Anthropic::Models::ToolUseBlockParam }

      variant :tool_result, -> { Anthropic::Models::ToolResultBlockParam }

      variant :document, -> { Anthropic::Models::DocumentBlockParam }
    end
  end
end
