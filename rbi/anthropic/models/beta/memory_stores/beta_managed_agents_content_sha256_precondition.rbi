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

          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsContentSha256Precondition::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Expected `content_sha256` of the stored memory (64 lowercase hexadecimal
          # characters). Typically the `content_sha256` returned by a prior read or list
          # call. Because the server applies no content normalization, clients can also
          # compute this locally as the SHA-256 of the UTF-8 content bytes.
          sig { returns(T.nilable(String)) }
          attr_reader :content_sha256

          sig { params(content_sha256: String).void }
          attr_writer :content_sha256

          # Optimistic-concurrency precondition: the update applies only if the memory's
          # stored `content_sha256` equals the supplied value. On mismatch, the request
          # returns `memory_precondition_failed_error` (HTTP 409); re-read the memory and
          # retry against the fresh state. If the precondition fails but the stored state
          # already exactly matches the requested `content` and `path`, the server returns
          # 200 instead of 409.
          sig do
            params(
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsContentSha256Precondition::Type::OrSymbol,
              content_sha256: String
            ).returns(T.attached_class)
          end
          def self.new(
            type:,
            # Expected `content_sha256` of the stored memory (64 lowercase hexadecimal
            # characters). Typically the `content_sha256` returned by a prior read or list
            # call. Because the server applies no content normalization, clients can also
            # compute this locally as the SHA-256 of the UTF-8 content bytes.
            content_sha256: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsContentSha256Precondition::Type::OrSymbol,
                content_sha256: String
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsContentSha256Precondition::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CONTENT_SHA256 =
              T.let(
                :content_sha256,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsContentSha256Precondition::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsContentSha256Precondition::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
