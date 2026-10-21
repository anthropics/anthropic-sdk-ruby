# typed: strong

module Anthropic
  module Models
    BetaDreamMemoryStoreInput = Beta::BetaDreamMemoryStoreInput

    module Beta
      class BetaDreamMemoryStoreInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDreamMemoryStoreInput,
              Anthropic::Internal::AnyHash
            )
          end

        # The ID of the memory store for the dream to read (`memstore_...`).
        #
        # The memory store must be in the same workspace as the dream and must not be
        # archived.
        sig { returns(String) }
        attr_accessor :memory_store_id

        sig { returns(Symbol) }
        attr_accessor :type

        # The memory store that a dream reads, given as an entry in `inputs`.
        #
        # With `output_behavior` set to `update_existing`, the dream writes its result
        # into this memory store. Otherwise the dream doesn't change it.
        sig do
          params(memory_store_id: String, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # The ID of the memory store for the dream to read (`memstore_...`).
          #
          # The memory store must be in the same workspace as the dream and must not be
          # archived.
          memory_store_id:,
          type: :memory_store
        )
        end

        sig { override.returns({ memory_store_id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
