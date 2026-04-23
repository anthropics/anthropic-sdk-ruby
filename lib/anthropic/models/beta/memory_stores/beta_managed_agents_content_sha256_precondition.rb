# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsContentSha256Precondition < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsContentSha256Precondition::Type]
          required :type,
                   enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsContentSha256Precondition::Type }

          # @!attribute content_sha256
          #
          #   @return [String, nil]
          optional :content_sha256, String

          # @!method initialize(type:, content_sha256: nil)
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsContentSha256Precondition::Type]
          #   @param content_sha256 [String]

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsContentSha256Precondition#type
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
