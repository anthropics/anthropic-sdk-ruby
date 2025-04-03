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

        # @!parse
        #   # @return [Array(Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation)]
        #   def self.variants; end
      end
    end

    BetaTextCitation = Beta::BetaTextCitation
  end
end
