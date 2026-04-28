# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # The kind of mutation a `memory_version` records. Every non-no-op mutation to a
        # memory appends exactly one version row with one of these values.
        module BetaManagedAgentsMemoryVersionOperation
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CREATED =
            T.let(
              :created,
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::TaggedSymbol
            )
          MODIFIED =
            T.let(
              :modified,
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::TaggedSymbol
            )
          DELETED =
            T.let(
              :deleted,
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::TaggedSymbol
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
