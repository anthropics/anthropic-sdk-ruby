# typed: strong

module Anthropic
  module Models
    BetaDreamModelConfig = Beta::BetaDreamModelConfig

    module Beta
      class BetaDreamModelConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDreamModelConfig,
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
              Anthropic::Beta::BetaDreamModelConfig::Speed::TaggedSymbol
            )
          )
        end
        attr_reader :speed

        sig do
          params(
            speed: Anthropic::Beta::BetaDreamModelConfig::Speed::OrSymbol
          ).void
        end
        attr_writer :speed

        # Model identifier and configuration applied to every pipeline stage. Same wire
        # shape as the Agents API ModelConfig.
        sig do
          params(
            id: String,
            speed: Anthropic::Beta::BetaDreamModelConfig::Speed::OrSymbol
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
              speed: Anthropic::Beta::BetaDreamModelConfig::Speed::TaggedSymbol
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
              T.all(Symbol, Anthropic::Beta::BetaDreamModelConfig::Speed)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STANDARD =
            T.let(
              :standard,
              Anthropic::Beta::BetaDreamModelConfig::Speed::TaggedSymbol
            )
          FAST =
            T.let(
              :fast,
              Anthropic::Beta::BetaDreamModelConfig::Speed::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaDreamModelConfig::Speed::TaggedSymbol
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
