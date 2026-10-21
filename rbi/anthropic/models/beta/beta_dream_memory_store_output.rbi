# typed: strong

module Anthropic
  module Models
    BetaDreamMemoryStoreOutput = Beta::BetaDreamMemoryStoreOutput

    module Beta
      class BetaDreamMemoryStoreOutput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDreamMemoryStoreOutput,
              Anthropic::Internal::AnyHash
            )
          end

        # The ID of the memory store that the dream writes its result to (`memstore_...`).
        #
        # With `output_behavior` set to `create_new`, this is a new memory store. With
        # `update_existing`, it is the input memory store.
        sig { returns(String) }
        attr_accessor :memory_store_id

        sig { returns(Symbol) }
        attr_accessor :type

        # The memory store that holds a dream's result, as an entry in `outputs`.
        sig do
          params(memory_store_id: String, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # The ID of the memory store that the dream writes its result to (`memstore_...`).
          #
          # With `output_behavior` set to `create_new`, this is a new memory store. With
          # `update_existing`, it is the input memory store.
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
