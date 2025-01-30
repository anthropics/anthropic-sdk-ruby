# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @abstract
      #
      # @example
      # ```ruby
      # case beta_content_block_param
      # in {type: "text", text: String, cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral, citations: -> { Anthropic::ArrayOf[union: Anthropic::Models::Beta::BetaTextCitationParam] === _1 }}
      #   # Anthropic::Models::Beta::BetaTextBlockParam ...
      # in {type: "image", source: Anthropic::Models::Beta::BetaImageBlockParam::Source, cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral}
      #   # Anthropic::Models::Beta::BetaImageBlockParam ...
      # in {type: "tool_use", id: String, input: Anthropic::Unknown, name: String}
      #   # Anthropic::Models::Beta::BetaToolUseBlockParam ...
      # in {type: "tool_result", tool_use_id: String, cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral, content: Anthropic::Models::Beta::BetaToolResultBlockParam::Content}
      #   # Anthropic::Models::Beta::BetaToolResultBlockParam ...
      # in {type: "document", source: Anthropic::Models::Beta::BetaBase64PDFBlock::Source, cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral, citations: Anthropic::Models::Beta::BetaCitationsConfigParam}
      #   # Anthropic::Models::Beta::BetaBase64PDFBlock ...
      # end
      # ```
      #
      # @example
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
