# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaContentBlockSourceContent
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :text, -> { Anthropic::Beta::BetaTextBlockParam }

        variant :image, -> { Anthropic::Beta::BetaImageBlockParam }

        # @!method self.variants
        #   @return [Array(Anthropic::Beta::BetaTextBlockParam, Anthropic::Beta::BetaImageBlockParam)]
      end
    end

    BetaContentBlockSourceContent = Beta::BetaContentBlockSourceContent
  end
end
