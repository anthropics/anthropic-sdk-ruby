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
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsContentSha256Precondition}
          #   for more details.
          #
          #   Optimistic-concurrency precondition: the update applies only if the memory's
          #   stored `content_sha256` equals the supplied value. On mismatch, the request
          #   returns `memory_precondition_failed_error` (HTTP 409); re-read the memory and
          #   retry against the fresh state. If the precondition fails but the stored state
          #   already exactly matches the requested `content` and `path`, the server returns
          #   200 instead of 409.
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
