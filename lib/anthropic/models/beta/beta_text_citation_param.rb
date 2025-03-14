# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @abstract
      class BetaTextCitationParam < Anthropic::Union
        discriminator :type

        variant :char_location, -> { Anthropic::Models::Beta::BetaCitationCharLocationParam }

        variant :page_location, -> { Anthropic::Models::Beta::BetaCitationPageLocationParam }

        variant :content_block_location, -> { Anthropic::Models::Beta::BetaCitationContentBlockLocationParam }
      end
    end

    BetaTextCitationParam = Beta::BetaTextCitationParam
  end
end
