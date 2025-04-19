# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaTextCitation
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :char_location, -> { Anthropic::Models::Beta::BetaCitationCharLocation }

        variant :page_location, -> { Anthropic::Models::Beta::BetaCitationPageLocation }

        variant :content_block_location, -> { Anthropic::Models::Beta::BetaCitationContentBlockLocation }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation)]
      end
    end

    BetaTextCitation = Beta::BetaTextCitation
  end
end
