# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsModelConfigParams =
      Beta::BetaManagedAgentsModelConfigParams

    module Beta
      class BetaManagedAgentsModelConfigParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsModelConfigParams,
              Anthropic::Internal::AnyHash
            )
          end

        # The model that will power your agent.\n\nSee
        # [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        # details and options.
        sig do
          returns(
            T.any(Anthropic::Beta::BetaManagedAgentsModel::OrSymbol, String)
          )
        end
        attr_accessor :id

        # Inference speed mode. `fast` provides significantly faster output token
        # generation at premium pricing. Not all models support `fast`; invalid
        # combinations are rejected at create time.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsModelConfigParams::Speed::OrSymbol
            )
          )
        end
        attr_accessor :speed

        # An object that defines additional configuration control over model use
        sig do
          params(
            id:
              T.any(Anthropic::Beta::BetaManagedAgentsModel::OrSymbol, String),
            speed:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::Speed::OrSymbol
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The model that will power your agent.\n\nSee
          # [models](https://docs.anthropic.com/en/docs/models-overview) for additional
          # details and options.
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
              id:
                T.any(
                  Anthropic::Beta::BetaManagedAgentsModel::OrSymbol,
                  String
                ),
              speed:
                T.nilable(
                  Anthropic::Beta::BetaManagedAgentsModelConfigParams::Speed::OrSymbol
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
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::Speed
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STANDARD =
            T.let(
              :standard,
              Anthropic::Beta::BetaManagedAgentsModelConfigParams::Speed::TaggedSymbol
            )
          FAST =
            T.let(
              :fast,
              Anthropic::Beta::BetaManagedAgentsModelConfigParams::Speed::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::Speed::TaggedSymbol
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
