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

          # The memory was created. The first version in any memory's lineage.
          CREATED =
            T.let(
              :created,
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::TaggedSymbol
            )

          # The memory's `content`, `path`, or both were changed via update. Writes the agent makes through the filesystem mount also appear as `modified`.
          MODIFIED =
            T.let(
              :modified,
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::TaggedSymbol
            )

          # The memory was deleted. The `content`, `content_size_bytes`, and `content_sha256` fields are `null` on this version. The preceding version, while it is retained, records the deleted content's size and hash.
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
