# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @abstract
      #
      class BetaTextCitation < Anthropic::Union
        discriminator :type

        variant :char_location, -> { Anthropic::Models::Beta::BetaCitationCharLocation }

        variant :page_location, -> { Anthropic::Models::Beta::BetaCitationPageLocation }

        variant :content_block_location, -> { Anthropic::Models::Beta::BetaCitationContentBlockLocation }
      end
    end

    BetaTextCitation = Beta::BetaTextCitation
  end
end
