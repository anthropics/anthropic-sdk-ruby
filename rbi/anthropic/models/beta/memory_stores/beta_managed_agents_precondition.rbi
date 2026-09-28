# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsPrecondition < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition::Type::OrSymbol
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

          # Optional condition that must hold for an update to apply. When omitted, the
          # update is unconditional. Asserts the current state of the memory being updated.
          # When an update changes `path`, the precondition still refers to the memory's
          # current content, not the destination path. Currently the only supported variant
          # is `content_sha256`.
          sig do
            params(
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition::Type::OrSymbol,
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
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition::Type::OrSymbol,
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
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CONTENT_SHA256 =
              T.let(
                :content_sha256,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition::Type::TaggedSymbol
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
