# typed: strong

module Anthropic
  module Models
    BetaOutputBehaviorUpdateExisting = Beta::BetaOutputBehaviorUpdateExisting

    module Beta
      class BetaOutputBehaviorUpdateExisting < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaOutputBehaviorUpdateExisting,
              Anthropic::Internal::AnyHash
            )
          end

        # The ID of the memory store for the dream to write its result to
        # (`memstore_...`). It must be the memory store in the `memory_store` entry of
        # `inputs`.
        sig { returns(String) }
        attr_accessor :memory_store_id

        sig { returns(Symbol) }
        attr_accessor :type

        # Write the result into the input memory store instead of a new memory store.
        #
        # The credential must be allowed to write memory stores, or the request returns a
        # 403 error. While another `update_existing` dream on the same memory store hasn't
        # fully stopped, the request returns a 409 error.
        sig do
          params(memory_store_id: String, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # The ID of the memory store for the dream to write its result to
          # (`memstore_...`). It must be the memory store in the `memory_store` entry of
          # `inputs`.
          memory_store_id:,
          type: :update_existing
        )
        end

        sig { override.returns({ memory_store_id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
