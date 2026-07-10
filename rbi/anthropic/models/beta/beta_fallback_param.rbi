# typed: strong

module Anthropic
  module Models
    BetaFallbackParam = Beta::BetaFallbackParam

    module Beta
      class BetaFallbackParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaFallbackParam,
              Anthropic::Internal::AnyHash
            )
          end

        # The model that will complete your prompt.
        #
        # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        # details and options.
        sig { returns(T.any(Anthropic::Model::OrSymbol, String)) }
        attr_accessor :model

        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_tokens

        sig { returns(T.nilable(Anthropic::Beta::BetaOutputConfig)) }
        attr_reader :output_config

        sig do
          params(
            output_config: T.nilable(Anthropic::Beta::BetaOutputConfig::OrHash)
          ).void
        end
        attr_writer :output_config

        # Inference speed mode. `fast` provides significantly faster output token
        # generation at premium pricing. Not all models support `fast`; invalid
        # combinations are rejected at create time.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaFallbackParam::Speed::OrSymbol)
          )
        end
        attr_accessor :speed

        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaThinkingConfigEnabled,
                Anthropic::Beta::BetaThinkingConfigDisabled,
                Anthropic::Beta::BetaThinkingConfigAdaptive
              )
            )
          )
        end
        attr_accessor :thinking

        # One entry in the `fallbacks` chain on a `/v1/messages` request.
        #
        # `model` is required. The override fields (`max_tokens`, `thinking`,
        # `output_config`, and `speed`) set the corresponding parameter for this attempt
        # only and are validated as if the request were made to `model`. Any other key is
        # rejected at parse time.
        sig do
          params(
            model: T.any(Anthropic::Model::OrSymbol, String),
            max_tokens: T.nilable(Integer),
            output_config: T.nilable(Anthropic::Beta::BetaOutputConfig::OrHash),
            speed:
              T.nilable(Anthropic::Beta::BetaFallbackParam::Speed::OrSymbol),
            thinking:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaThinkingConfigEnabled::OrHash,
                  Anthropic::Beta::BetaThinkingConfigDisabled::OrHash,
                  Anthropic::Beta::BetaThinkingConfigAdaptive::OrHash
                )
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The model that will complete your prompt.
          #
          # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
          # details and options.
          model:,
          max_tokens: nil,
          output_config: nil,
          # Inference speed mode. `fast` provides significantly faster output token
          # generation at premium pricing. Not all models support `fast`; invalid
          # combinations are rejected at create time.
          speed: nil,
          thinking: nil
        )
        end

        sig do
          override.returns(
            {
              model: T.any(Anthropic::Model::OrSymbol, String),
              max_tokens: T.nilable(Integer),
              output_config: T.nilable(Anthropic::Beta::BetaOutputConfig),
              speed:
                T.nilable(Anthropic::Beta::BetaFallbackParam::Speed::OrSymbol),
              thinking:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaThinkingConfigEnabled,
                    Anthropic::Beta::BetaThinkingConfigDisabled,
                    Anthropic::Beta::BetaThinkingConfigAdaptive
                  )
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
              T.all(Symbol, Anthropic::Beta::BetaFallbackParam::Speed)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STANDARD =
            T.let(
              :standard,
              Anthropic::Beta::BetaFallbackParam::Speed::TaggedSymbol
            )
          FAST =
            T.let(
              :fast,
              Anthropic::Beta::BetaFallbackParam::Speed::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaFallbackParam::Speed::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        module Thinking
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaThinkingConfigEnabled,
                Anthropic::Beta::BetaThinkingConfigDisabled,
                Anthropic::Beta::BetaThinkingConfigAdaptive
              )
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaFallbackParam::Thinking::Variants]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
