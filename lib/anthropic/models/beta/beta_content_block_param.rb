# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      #
      # ```ruby
      # case beta_content_block_param
      # in {type: "text", text: String, type: enum: Anthropic::Models::Beta::BetaTextBlockParam::Type, cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral}
      #   # Anthropic::Models::Beta::BetaTextBlockParam ...
      # in {type: "image", source: Anthropic::Models::Beta::BetaImageBlockParam::Source, type: enum: Anthropic::Models::Beta::BetaImageBlockParam::Type, cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral}
      #   # Anthropic::Models::Beta::BetaImageBlockParam ...
      # in {type: "tool_use", id: String, input: Anthropic::Unknown, name: String}
      #   # Anthropic::Models::Beta::BetaToolUseBlockParam ...
      # in {type: "tool_result", tool_use_id: String, type: enum: Anthropic::Models::Beta::BetaToolResultBlockParam::Type, cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral}
      #   # Anthropic::Models::Beta::BetaToolResultBlockParam ...
      # in {type: "document", source: Anthropic::Models::Beta::BetaBase64PDFSource, type: enum: Anthropic::Models::Beta::BetaBase64PDFBlock::Type, cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral}
      #   # Anthropic::Models::Beta::BetaBase64PDFBlock ...
      # end
      # ```
      #
      # @example
      #
      # ```ruby
      # case beta_content_block_param
      # in Anthropic::Models::Beta::BetaTextBlockParam
      #   # ...
      # in Anthropic::Models::Beta::BetaImageBlockParam
      #   # ...
      # in Anthropic::Models::Beta::BetaToolUseBlockParam
      #   # ...
      # in Anthropic::Models::Beta::BetaToolResultBlockParam
      #   # ...
      # in Anthropic::Models::Beta::BetaBase64PDFBlock
      #   # ...
      # end
      # ```
      class BetaContentBlockParam < Anthropic::Union
        discriminator :type

        variant :text, -> { Anthropic::Models::Beta::BetaTextBlockParam }

        variant :image, -> { Anthropic::Models::Beta::BetaImageBlockParam }

        variant :tool_use, -> { Anthropic::Models::Beta::BetaToolUseBlockParam }

        variant :tool_result, -> { Anthropic::Models::Beta::BetaToolResultBlockParam }

        variant :document, -> { Anthropic::Models::Beta::BetaBase64PDFBlock }
      end
    end

    BetaContentBlockParam = Beta::BetaContentBlockParam
  end
end
