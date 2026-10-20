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
          #   Expected `content_sha256` of the stored memory (64 lowercase hexadecimal
          #   characters). Typically the `content_sha256` returned by a prior read or list
          #   call. Because the server applies no content normalization, clients can also
          #   compute this locally as the SHA-256 of the UTF-8 content bytes.
          #
          #   @return [String, nil]
          optional :content_sha256, String

          # @!method initialize(type:, content_sha256: nil)
          #   A precondition that applies an update only if the memory's current content has
          #   the hash in `content_sha256`.
          #
          #   If the hashes differ, the request fails with HTTP status 409. Retrieve the
          #   memory and retry. If the memory already has exactly the requested `content` and
          #   `path`, the request succeeds even though the hashes differ.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsContentSha256Precondition}
          #   for more details.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsContentSha256Precondition::Type]
          #
          #   @param content_sha256 [String] Expected `content_sha256` of the stored memory (64 lowercase hexadecimal charact

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
