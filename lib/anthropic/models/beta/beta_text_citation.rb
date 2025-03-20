# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaTextCitation
        extend Anthropic::Union

        discriminator :type

        variant :char_location, -> { Anthropic::Models::Beta::BetaCitationCharLocation }

        variant :page_location, -> { Anthropic::Models::Beta::BetaCitationPageLocation }

        variant :content_block_location, -> { Anthropic::Models::Beta::BetaCitationContentBlockLocation }

        # @!parse
        #   class << self
        #     # @return [Array(Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation)]
        #     def variants; end
        #   end
      end
    end

    BetaTextCitation = Beta::BetaTextCitation
  end
end
