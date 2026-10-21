# typed: strong

module Anthropic
  module Models
    BetaDreamOutput = Beta::BetaDreamOutput

    module Beta
      class BetaDreamOutput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDreamOutput,
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

        # An entry in a dream's `outputs` that references the memory store holding its
        # result.
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
