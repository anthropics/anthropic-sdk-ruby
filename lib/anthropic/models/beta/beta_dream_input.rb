# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # An input memory store the dream reads from. The dream never mutates this store.
      module BetaDreamInput
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # An input memory store the dream reads from. The dream never mutates this store.
        variant :memory_store, -> { Anthropic::Beta::BetaDreamMemoryStoreInput }

        # Input session transcripts the dream reads.
        variant :sessions, -> { Anthropic::Beta::BetaDreamSessionsInput }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput)]
      end
    end

    BetaDreamInput = Beta::BetaDreamInput
  end
end
