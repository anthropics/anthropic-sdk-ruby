# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsMemoryPrefix < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :path

          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              path: String,
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(path:, type:)
          end

          sig do
            override.returns(
              {
                path: String,
                type:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type::TaggedSymbol
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
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MEMORY_PREFIX =
              T.let(
                :memory_prefix,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type::TaggedSymbol
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
