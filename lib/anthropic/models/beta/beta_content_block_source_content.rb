# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @abstract
      #
      # @example
      # ```ruby
      # case beta_content_block_source_content
      # in {type: "text", text: String, cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral, citations: -> { Anthropic::ArrayOf[union: Anthropic::Models::Beta::BetaTextCitationParam] === _1 }}
      #   # Anthropic::Models::Beta::BetaTextBlockParam ...
      # in {type: "image", source: Anthropic::Models::Beta::BetaImageBlockParam::Source, cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral}
      #   # Anthropic::Models::Beta::BetaImageBlockParam ...
      # end
      # ```
      #
      # @example
      # ```ruby
      # case beta_content_block_source_content
      # in Anthropic::Models::Beta::BetaTextBlockParam
      #   # ...
      # in Anthropic::Models::Beta::BetaImageBlockParam
      #   # ...
      # end
      # ```
      class BetaContentBlockSourceContent < Anthropic::Union
        discriminator :type

        variant :text, -> { Anthropic::Models::Beta::BetaTextBlockParam }

        variant :image, -> { Anthropic::Models::Beta::BetaImageBlockParam }
      end
    end

    BetaContentBlockSourceContent = Beta::BetaContentBlockSourceContent
  end
end
