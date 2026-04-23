# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsMemoryPrefix < Anthropic::Internal::Type::BaseModel
          # @!attribute path
          #
          #   @return [String]
          required :path, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type }

          # @!method initialize(path:, type:)
          #   @param path [String]
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type]

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix#type
          module Type
            extend Anthropic::Internal::Type::Enum

            MEMORY_PREFIX = :memory_prefix

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
