# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # Whether a `memory` or `memory_version` in the response includes its `content`.
        # Defaults to `full` on retrieve operations and to `basic` on list, create, and
        # update operations.
        #
        # With `full`, list operations return at most 20 items per page.
        module BetaManagedAgentsMemoryView
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Return the object with `content` set to `null`. The `content_size_bytes` and `content_sha256` fields remain populated, so sync clients can diff without fetching content.
          BASIC =
            T.let(
              :basic,
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::TaggedSymbol
            )

          # Return the object with `content` populated. On list endpoints, `view=full` caps `limit` at 20.
          FULL =
            T.let(
              :full,
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::TaggedSymbol
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
