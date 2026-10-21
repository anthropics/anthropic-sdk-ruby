# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsContentSha256Precondition < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsContentSha256Precondition,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # Expected `content_sha256` of the stored memory (64 lowercase hexadecimal
          # characters). Typically the `content_sha256` returned by a prior read or list
          # call. Because the server applies no content normalization, clients can also
          # compute this locally as the SHA-256 of the UTF-8 content bytes.
          sig { returns(T.nilable(String)) }
          attr_reader :content_sha256

          sig { params(content_sha256: String).void }
          attr_writer :content_sha256

          # A precondition that applies an update only if the memory's current content has
          # the hash in `content_sha256`.
          #
          # If the hashes differ, the request fails with HTTP status 409. Retrieve the
          # memory and retry. If the memory already has exactly the requested `content` and
          # `path`, the request succeeds even though the hashes differ.
          sig do
            params(content_sha256: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Expected `content_sha256` of the stored memory (64 lowercase hexadecimal
            # characters). Typically the `content_sha256` returned by a prior read or list
            # call. Because the server applies no content normalization, clients can also
            # compute this locally as the SHA-256 of the UTF-8 content bytes.
            content_sha256: nil,
            type: :content_sha256
          )
          end

          sig { override.returns({ type: Symbol, content_sha256: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
