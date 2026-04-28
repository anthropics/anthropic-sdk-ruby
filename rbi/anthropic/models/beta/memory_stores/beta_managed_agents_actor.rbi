# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # Identifies who performed a write or redact operation. Captured at write time on
        # the `memory_version` row. The API key that created a session is not recorded on
        # agent writes; attribution answers who made the write, not who is ultimately
        # responsible. Look up session provenance separately via the
        # [Sessions API](/en/api/sessions-retrieve).
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
