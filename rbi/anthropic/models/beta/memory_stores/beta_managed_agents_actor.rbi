# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        module BetaManagedAgentsActor
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Variants
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
