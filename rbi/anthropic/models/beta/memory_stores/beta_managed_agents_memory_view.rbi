# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # Selects which projection of a `memory` or `memory_version` the server returns.
        # `basic` returns the object with `content` set to `null`; `full` populates
        # `content`. When omitted, the default is endpoint-specific: retrieve operations
        # default to `full`; list, create, and update operations default to `basic`.
        # Listing with `view=full` caps `limit` at 20.
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

          BASIC =
            T.let(
              :basic,
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::TaggedSymbol
            )
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
