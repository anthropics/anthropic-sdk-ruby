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

        sig { returns(String) }
        attr_accessor :memory_store_id

        sig do
          returns(Anthropic::Beta::BetaDreamMemoryStoreInput::Type::OrSymbol)
        end
        attr_accessor :type

        # An input memory store the dream reads from. The dream never mutates this store.
        sig do
          params(
            memory_store_id: String,
            type: Anthropic::Beta::BetaDreamMemoryStoreInput::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(memory_store_id:, type:)
        end

        sig do
          override.returns(
            {
              memory_store_id: String,
              type: Anthropic::Beta::BetaDreamMemoryStoreInput::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaDreamMemoryStoreInput::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MEMORY_STORE =
            T.let(
              :memory_store,
              Anthropic::Beta::BetaDreamMemoryStoreInput::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaDreamMemoryStoreInput::Type::TaggedSymbol
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
