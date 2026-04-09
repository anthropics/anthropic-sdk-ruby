# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Token usage for a sampling iteration.
      module BetaIterationsUsageItem
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # Token usage for a sampling iteration.
        variant :message, -> { Anthropic::Beta::BetaMessageIterationUsage }

        # Token usage for a compaction iteration.
        variant :compaction, -> { Anthropic::Beta::BetaCompactionIterationUsage }

        # Token usage for an advisor sub-inference iteration.
        variant :advisor_message, -> { Anthropic::Beta::BetaAdvisorMessageIterationUsage }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaMessageIterationUsage, Anthropic::Models::Beta::BetaCompactionIterationUsage, Anthropic::Models::Beta::BetaAdvisorMessageIterationUsage)]
      end

      # @type [Anthropic::Internal::Type::Converter]
      BetaIterationsUsage =
        Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::Beta::BetaIterationsUsageItem }]
    end

    # @type [Anthropic::Internal::Type::Converter]
    BetaIterationsUsage = Beta::BetaIterationsUsage
  end
end
