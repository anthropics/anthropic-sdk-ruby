# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # @see Anthropic::Resources::Beta::MemoryStores::Memories#list
        module BetaManagedAgentsMemoryListItem
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :memory, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory }

          variant :memory_prefix, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix)]
        end
      end
    end
  end
end
