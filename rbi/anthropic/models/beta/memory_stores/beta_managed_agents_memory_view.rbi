# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # MemoryView enum
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
