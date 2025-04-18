# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaTextCitationParam
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :char_location, -> { Anthropic::Models::Beta::BetaCitationCharLocationParam }

        variant :page_location, -> { Anthropic::Models::Beta::BetaCitationPageLocationParam }

        variant :content_block_location, -> { Anthropic::Models::Beta::BetaCitationContentBlockLocationParam }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaCitationCharLocationParam, Anthropic::Models::Beta::BetaCitationPageLocationParam, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam)]
      end
    end

    BetaTextCitationParam = Beta::BetaTextCitationParam
  end
end
