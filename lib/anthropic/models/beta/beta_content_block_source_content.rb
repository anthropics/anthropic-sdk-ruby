# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @abstract
      class BetaContentBlockSourceContent < Anthropic::Union
        discriminator :type

        variant :text, -> { Anthropic::Models::Beta::BetaTextBlockParam }

        variant :image, -> { Anthropic::Models::Beta::BetaImageBlockParam }
      end
    end

    BetaContentBlockSourceContent = Beta::BetaContentBlockSourceContent
  end
end
