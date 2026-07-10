# typed: strong

module Anthropic
  module Models
    BetaDreamModelConfigParam = Beta::BetaDreamModelConfigParam

    module Beta
      class BetaDreamModelConfigParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDreamModelConfigParam,
              Anthropic::Internal::AnyHash
            )
          end

        # Model identifier, e.g. "claude-opus-4-7". 1-256 characters.
        sig { returns(String) }
        attr_accessor :id

        # Inference speed mode. `fast` provides significantly faster output token
        # generation at premium pricing. Not all models support `fast`; invalid
        # combinations are rejected at create time.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaDreamModelConfigParam::Speed::OrSymbol
            )
          )
        end
        attr_accessor :speed

        # Model identifier and configuration applied to every pipeline stage.
        sig do
          params(
            id: String,
            speed:
              T.nilable(
                Anthropic::Beta::BetaDreamModelConfigParam::Speed::OrSymbol
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Model identifier, e.g. "claude-opus-4-7". 1-256 characters.
          id:,
          # Inference speed mode. `fast` provides significantly faster output token
          # generation at premium pricing. Not all models support `fast`; invalid
          # combinations are rejected at create time.
          speed: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              speed:
                T.nilable(
                  Anthropic::Beta::BetaDreamModelConfigParam::Speed::OrSymbol
                )
            }
          )
        end
        def to_hash
        end

        # Inference speed mode. `fast` provides significantly faster output token
        # generation at premium pricing. Not all models support `fast`; invalid
        # combinations are rejected at create time.
        module Speed
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaDreamModelConfigParam::Speed)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STANDARD =
            T.let(
              :standard,
              Anthropic::Beta::BetaDreamModelConfigParam::Speed::TaggedSymbol
            )
          FAST =
            T.let(
              :fast,
              Anthropic::Beta::BetaDreamModelConfigParam::Speed::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaDreamModelConfigParam::Speed::TaggedSymbol
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
