# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsPrecondition < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :content_sha256]
          required :type, const: :content_sha256

          # @!attribute content_sha256
          #   Expected `content_sha256` of the stored memory (64 lowercase hexadecimal
          #   characters). Typically the `content_sha256` returned by a prior read or list
          #   call. Because the server applies no content normalization, clients can also
          #   compute this locally as the SHA-256 of the UTF-8 content bytes.
          #
          #   @return [String, nil]
          optional :content_sha256, String

          # @!method initialize(content_sha256: nil, type: :content_sha256)
          #   Optional condition that must hold for an update to apply. When omitted, the
          #   update is unconditional. Asserts the current state of the memory being updated.
          #   When an update changes `path`, the precondition still refers to the memory's
          #   current content, not the destination path. Currently the only supported variant
          #   is `content_sha256`.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsPrecondition} for more
          #   details.
          #
          #   @param content_sha256 [String] Expected `content_sha256` of the stored memory (64 lowercase hexadecimal charact
          #
          #   @param type [Symbol, :content_sha256]
        end
      end
    end
  end
end
