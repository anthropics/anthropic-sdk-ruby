# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaTextCitation
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :char_location, -> { Anthropic::Beta::BetaCitationCharLocation }

        variant :page_location, -> { Anthropic::Beta::BetaCitationPageLocation }

        variant :content_block_location, -> { Anthropic::Beta::BetaCitationContentBlockLocation }

        # @!method self.variants
        #   @return [Array(Anthropic::Beta::BetaCitationCharLocation, Anthropic::Beta::BetaCitationPageLocation, Anthropic::Beta::BetaCitationContentBlockLocation)]
      end
    end

    BetaTextCitation = Beta::BetaTextCitation
  end
end
