# typed: strong

module Anthropic
  module Models
    BetaOutputBehavior = Beta::BetaOutputBehavior

    module Beta
      module BetaOutputBehavior
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaOutputBehaviorCreateNew,
              Anthropic::Beta::BetaOutputBehaviorUpdateExisting
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaOutputBehavior::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CREATE_NEW =
            T.let(
              :create_new,
              Anthropic::Beta::BetaOutputBehavior::Type::TaggedSymbol
            )
          UPDATE_EXISTING =
            T.let(
              :update_existing,
              Anthropic::Beta::BetaOutputBehavior::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaOutputBehavior::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaOutputBehavior::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: Anthropic::Beta::BetaOutputBehavior::Type::OrSymbol,
            memory_store_id: String
          ).returns(Anthropic::Beta::BetaOutputBehavior::Variants)
        end
        def self.new(type:, memory_store_id: nil)
        end
      end
    end
  end
end
