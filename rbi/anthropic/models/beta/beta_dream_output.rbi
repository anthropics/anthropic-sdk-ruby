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

        sig { returns(String) }
        attr_accessor :memory_store_id

        sig { returns(Anthropic::Beta::BetaDreamOutput::Type::TaggedSymbol) }
        attr_accessor :type

        # An output memory store the dream writes consolidated memories into.
        sig do
          params(
            memory_store_id: String,
            type: Anthropic::Beta::BetaDreamOutput::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(memory_store_id:, type:)
        end

        sig do
          override.returns(
            {
              memory_store_id: String,
              type: Anthropic::Beta::BetaDreamOutput::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaDreamOutput::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MEMORY_STORE =
            T.let(
              :memory_store,
              Anthropic::Beta::BetaDreamOutput::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaDreamOutput::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
