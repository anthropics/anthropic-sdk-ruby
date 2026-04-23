# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        module BetaManagedAgentsMemoryListItem
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryListItem::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
