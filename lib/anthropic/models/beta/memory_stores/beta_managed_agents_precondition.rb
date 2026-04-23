# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsPrecondition < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsPrecondition::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition::Type }

          # @!attribute content_sha256
          #
          #   @return [String, nil]
          optional :content_sha256, String

          # @!method initialize(type:, content_sha256: nil)
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsPrecondition::Type]
          #   @param content_sha256 [String]

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsPrecondition#type
          module Type
            extend Anthropic::Internal::Type::Enum

            CONTENT_SHA256 = :content_sha256

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
