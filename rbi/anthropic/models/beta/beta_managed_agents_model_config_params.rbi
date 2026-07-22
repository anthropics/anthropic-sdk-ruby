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

        # The model that will power your agent.
        #
        # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        # details and options.
        sig do
          returns(
            T.any(Anthropic::Beta::BetaManagedAgentsModel::OrSymbol, String)
          )
        end
        attr_accessor :id

        # How hard Claude works on each inference call. Accepts a bare level string
        # (`"high"`) or `{"type": "high"}`. On create, omitting it resolves the per-model
        # default; on update, omitting it leaves the stored value unchanged.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::Effort::BetaManagedAgentsEffortLevel::OrSymbol,
                Anthropic::Beta::BetaManagedAgentsEffortLow,
                Anthropic::Beta::BetaManagedAgentsEffortMedium,
                Anthropic::Beta::BetaManagedAgentsEffortHigh,
                Anthropic::Beta::BetaManagedAgentsEffortXhigh,
                Anthropic::Beta::BetaManagedAgentsEffortMax
              )
            )
          )
        end
        attr_accessor :effort

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
            effort:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsModelConfigParams::Effort::BetaManagedAgentsEffortLevel::OrSymbol,
                  Anthropic::Beta::BetaManagedAgentsEffortLow::OrHash,
                  Anthropic::Beta::BetaManagedAgentsEffortMedium::OrHash,
                  Anthropic::Beta::BetaManagedAgentsEffortHigh::OrHash,
                  Anthropic::Beta::BetaManagedAgentsEffortXhigh::OrHash,
                  Anthropic::Beta::BetaManagedAgentsEffortMax::OrHash
                )
              ),
            speed:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::Speed::OrSymbol
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The model that will power your agent.
          #
          # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
          # details and options.
          id:,
          # How hard Claude works on each inference call. Accepts a bare level string
          # (`"high"`) or `{"type": "high"}`. On create, omitting it resolves the per-model
          # default; on update, omitting it leaves the stored value unchanged.
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
              id:
                T.any(
                  Anthropic::Beta::BetaManagedAgentsModel::OrSymbol,
                  String
                ),
              effort:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsModelConfigParams::Effort::BetaManagedAgentsEffortLevel::OrSymbol,
                    Anthropic::Beta::BetaManagedAgentsEffortLow,
                    Anthropic::Beta::BetaManagedAgentsEffortMedium,
                    Anthropic::Beta::BetaManagedAgentsEffortHigh,
                    Anthropic::Beta::BetaManagedAgentsEffortXhigh,
                    Anthropic::Beta::BetaManagedAgentsEffortMax
                  )
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

        # How hard Claude works on each inference call. Accepts a bare level string
        # (`"high"`) or `{"type": "high"}`. On create, omitting it resolves the per-model
        # default; on update, omitting it leaves the stored value unchanged.
        module Effort
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::Effort::BetaManagedAgentsEffortLevel::TaggedSymbol,
                Anthropic::Beta::BetaManagedAgentsEffortLow,
                Anthropic::Beta::BetaManagedAgentsEffortMedium,
                Anthropic::Beta::BetaManagedAgentsEffortHigh,
                Anthropic::Beta::BetaManagedAgentsEffortXhigh,
                Anthropic::Beta::BetaManagedAgentsEffortMax
              )
            end

          # How hard Claude works on each turn. Higher levels favor reasoning depth over
          # latency. Not all models accept every level; invalid combinations are rejected at
          # create time.
          module BetaManagedAgentsEffortLevel
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaManagedAgentsModelConfigParams::Effort::BetaManagedAgentsEffortLevel
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            LOW =
              T.let(
                :low,
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::Effort::BetaManagedAgentsEffortLevel::TaggedSymbol
              )
            MEDIUM =
              T.let(
                :medium,
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::Effort::BetaManagedAgentsEffortLevel::TaggedSymbol
              )
            HIGH =
              T.let(
                :high,
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::Effort::BetaManagedAgentsEffortLevel::TaggedSymbol
              )
            XHIGH =
              T.let(
                :xhigh,
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::Effort::BetaManagedAgentsEffortLevel::TaggedSymbol
              )
            MAX =
              T.let(
                :max,
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::Effort::BetaManagedAgentsEffortLevel::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsModelConfigParams::Effort::BetaManagedAgentsEffortLevel::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsModelConfigParams::Effort::Variants
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
