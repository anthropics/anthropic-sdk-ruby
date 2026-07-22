# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsModelConfig = Beta::BetaManagedAgentsModelConfig

    module Beta
      class BetaManagedAgentsModelConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsModelConfig,
              Anthropic::Internal::AnyHash
            )
          end

        # The model that will power your agent.
        #
        # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        # details and options.
        sig { returns(Anthropic::Beta::BetaManagedAgentsModel::Variants) }
        attr_accessor :id

        # How hard Claude works on each turn. Sets `output_config.effort` on every
        # Messages call the session makes.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsModelConfig::Effort::Variants
            )
          )
        end
        attr_reader :effort

        sig do
          params(
            effort:
              T.any(
                Anthropic::Beta::BetaManagedAgentsEffortLow::OrHash,
                Anthropic::Beta::BetaManagedAgentsEffortMedium::OrHash,
                Anthropic::Beta::BetaManagedAgentsEffortHigh::OrHash,
                Anthropic::Beta::BetaManagedAgentsEffortXhigh::OrHash,
                Anthropic::Beta::BetaManagedAgentsEffortMax::OrHash
              )
          ).void
        end
        attr_writer :effort

        # Inference speed mode. `fast` provides significantly faster output token
        # generation at premium pricing. Not all models support `fast`; invalid
        # combinations are rejected at create time.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsModelConfig::Speed::TaggedSymbol
            )
          )
        end
        attr_reader :speed

        sig do
          params(
            speed:
              Anthropic::Beta::BetaManagedAgentsModelConfig::Speed::OrSymbol
          ).void
        end
        attr_writer :speed

        # Model identifier and configuration.
        sig do
          params(
            id:
              T.any(Anthropic::Beta::BetaManagedAgentsModel::OrSymbol, String),
            effort:
              T.any(
                Anthropic::Beta::BetaManagedAgentsEffortLow::OrHash,
                Anthropic::Beta::BetaManagedAgentsEffortMedium::OrHash,
                Anthropic::Beta::BetaManagedAgentsEffortHigh::OrHash,
                Anthropic::Beta::BetaManagedAgentsEffortXhigh::OrHash,
                Anthropic::Beta::BetaManagedAgentsEffortMax::OrHash
              ),
            speed:
              Anthropic::Beta::BetaManagedAgentsModelConfig::Speed::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The model that will power your agent.
          #
          # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
          # details and options.
          id:,
          # How hard Claude works on each turn. Sets `output_config.effort` on every
          # Messages call the session makes.
          effort: nil,
          # Inference speed mode. `fast` provides significantly faster output token
          # generation at premium pricing. Not all models support `fast`; invalid
          # combinations are rejected at create time.
          speed: nil
        )
        end

        sig do
          override.returns(
            {
              id: Anthropic::Beta::BetaManagedAgentsModel::Variants,
              effort:
                Anthropic::Beta::BetaManagedAgentsModelConfig::Effort::Variants,
              speed:
                Anthropic::Beta::BetaManagedAgentsModelConfig::Speed::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # How hard Claude works on each turn. Sets `output_config.effort` on every
        # Messages call the session makes.
        module Effort
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaManagedAgentsEffortLow,
                Anthropic::Beta::BetaManagedAgentsEffortMedium,
                Anthropic::Beta::BetaManagedAgentsEffortHigh,
                Anthropic::Beta::BetaManagedAgentsEffortXhigh,
                Anthropic::Beta::BetaManagedAgentsEffortMax
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsModelConfig::Effort::Variants
              ]
            )
          end
          def self.variants
          end
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
                Anthropic::Beta::BetaManagedAgentsModelConfig::Speed
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STANDARD =
            T.let(
              :standard,
              Anthropic::Beta::BetaManagedAgentsModelConfig::Speed::TaggedSymbol
            )
          FAST =
            T.let(
              :fast,
              Anthropic::Beta::BetaManagedAgentsModelConfig::Speed::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsModelConfig::Speed::TaggedSymbol
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
