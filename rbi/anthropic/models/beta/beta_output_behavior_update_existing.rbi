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

        sig { returns(String) }
        attr_accessor :memory_store_id

        sig do
          returns(
            Anthropic::Beta::BetaOutputBehaviorUpdateExisting::Type::OrSymbol
          )
        end
        attr_accessor :type

        # The job writes the consolidated memories into this existing memory store instead
        # of creating one. In EAP the store must be the job's own memory_store input, so
        # the job consolidates the store in place.
        sig do
          params(
            memory_store_id: String,
            type:
              Anthropic::Beta::BetaOutputBehaviorUpdateExisting::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(memory_store_id:, type:)
        end

        sig do
          override.returns(
            {
              memory_store_id: String,
              type:
                Anthropic::Beta::BetaOutputBehaviorUpdateExisting::Type::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaOutputBehaviorUpdateExisting::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          UPDATE_EXISTING =
            T.let(
              :update_existing,
              Anthropic::Beta::BetaOutputBehaviorUpdateExisting::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaOutputBehaviorUpdateExisting::Type::TaggedSymbol
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
