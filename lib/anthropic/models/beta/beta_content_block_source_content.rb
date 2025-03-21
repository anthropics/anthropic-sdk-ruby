# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaContentBlockSourceContent
        extend Anthropic::Union

        discriminator :type

        variant :text, -> { Anthropic::Models::Beta::BetaTextBlockParam }

        variant :image, -> { Anthropic::Models::Beta::BetaImageBlockParam }

        # @!parse
        #   # @return [Array(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]
        #   def self.variants; end
      end
    end

    BetaContentBlockSourceContent = Beta::BetaContentBlockSourceContent
  end
end
