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

          sig { returns(T.nilable(String)) }
          attr_reader :content_sha256

          sig { params(content_sha256: String).void }
          attr_writer :content_sha256

          sig do
            params(
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsContentSha256Precondition::Type::OrSymbol,
              content_sha256: String
            ).returns(T.attached_class)
          end
          def self.new(type:, content_sha256: nil)
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
