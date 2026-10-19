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

        # The `max_tokens` for the fallback attempt that uses this `fallbacks` entry's
        # `model`, in place of the request's `max_tokens`. If you leave it out or set it
        # to `null`, the attempt uses the request's `max_tokens`.
        #
        # See the
        # [refusals and fallback guide](https://platform.claude.com/docs/en/build-with-claude/refusals-and-fallback#naming-your-own-fallback-models)
        # to learn more about fallback entries.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_tokens

        # Output parameters for the fallback attempt that uses this `fallbacks` entry's
        # `model`, combined with the request's `output_config` one field at a time.
        #
        # - `format`: If you leave it out, the attempt uses the request's `format`. If you
        #   set it to `null`, the attempt runs without a format.
        # - `effort`: If you leave it out, the attempt uses the request's `effort` when
        #   `model` supports that level with the attempt's `thinking`. If the request
        #   doesn't set `effort`, if `model` doesn't support the level, or if you set
        #   `effort` to `null`, the attempt runs at the default effort of `model`.
        # - `task_budget`: If you leave it out, the attempt uses the request's
        #   `task_budget` when `model` accepts a task budget of that size. If the request
        #   doesn't set `task_budget`, if `model` doesn't accept it, or if you set
        #   `task_budget` to `null`, the attempt runs without a task budget.
        #
        # Set `output_config` to `null` to run the attempt without a format or a task
        # budget, at the default effort of `model`.
        #
        # These rules apply with the `server-side-fallback-2026-07-01` beta header.
        sig { returns(T.nilable(Anthropic::Beta::BetaOutputConfig)) }
        attr_reader :output_config

        sig do
          params(
            output_config: T.nilable(Anthropic::Beta::BetaOutputConfig::OrHash)
          ).void
        end
        attr_writer :output_config

        # The inference speed mode for the fallback attempt that uses this `fallbacks`
        # entry's `model`. If you leave it out, the attempt runs at `fast` speed only when
        # the request sets `speed` to `fast` and your organization can use fast mode on
        # `model`.
        #
        # Otherwise, or when you set this field to `null`, the attempt runs at `standard`
        # speed.
        #
        # These rules apply with the `server-side-fallback-2026-07-01` beta header.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaFallbackParam::Speed::OrSymbol)
          )
        end
        attr_accessor :speed

        # The thinking configuration for the fallback attempt that uses this `fallbacks`
        # entry's `model`. If you leave it out, the attempt uses the request's `thinking`
        # when `model` supports that thinking `type`.
        #
        # If you leave it out and the request's thinking `type` is `between_tools` but
        # `model` doesn't support `between_tools`, the attempt uses `disabled` if `model`
        # supports it. Otherwise, if `model` doesn't support the request's thinking
        # `type`, if the request doesn't set `thinking`, or if you set this field to
        # `null`, the attempt uses the thinking `type` that `model` uses when a request
        # leaves out `thinking`. The request's `thinking.display` still applies where
        # `model` allows it.
        #
        # These rules apply with the `server-side-fallback-2026-07-01` beta header.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaThinkingConfigEnabled,
                Anthropic::Beta::BetaThinkingConfigDisabled,
                Anthropic::Beta::BetaThinkingConfigBetweenTools,
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
                  Anthropic::Beta::BetaThinkingConfigBetweenTools::OrHash,
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
          # The `max_tokens` for the fallback attempt that uses this `fallbacks` entry's
          # `model`, in place of the request's `max_tokens`. If you leave it out or set it
          # to `null`, the attempt uses the request's `max_tokens`.
          #
          # See the
          # [refusals and fallback guide](https://platform.claude.com/docs/en/build-with-claude/refusals-and-fallback#naming-your-own-fallback-models)
          # to learn more about fallback entries.
          max_tokens: nil,
          # Output parameters for the fallback attempt that uses this `fallbacks` entry's
          # `model`, combined with the request's `output_config` one field at a time.
          #
          # - `format`: If you leave it out, the attempt uses the request's `format`. If you
          #   set it to `null`, the attempt runs without a format.
          # - `effort`: If you leave it out, the attempt uses the request's `effort` when
          #   `model` supports that level with the attempt's `thinking`. If the request
          #   doesn't set `effort`, if `model` doesn't support the level, or if you set
          #   `effort` to `null`, the attempt runs at the default effort of `model`.
          # - `task_budget`: If you leave it out, the attempt uses the request's
          #   `task_budget` when `model` accepts a task budget of that size. If the request
          #   doesn't set `task_budget`, if `model` doesn't accept it, or if you set
          #   `task_budget` to `null`, the attempt runs without a task budget.
          #
          # Set `output_config` to `null` to run the attempt without a format or a task
          # budget, at the default effort of `model`.
          #
          # These rules apply with the `server-side-fallback-2026-07-01` beta header.
          output_config: nil,
          # The inference speed mode for the fallback attempt that uses this `fallbacks`
          # entry's `model`. If you leave it out, the attempt runs at `fast` speed only when
          # the request sets `speed` to `fast` and your organization can use fast mode on
          # `model`.
          #
          # Otherwise, or when you set this field to `null`, the attempt runs at `standard`
          # speed.
          #
          # These rules apply with the `server-side-fallback-2026-07-01` beta header.
          speed: nil,
          # The thinking configuration for the fallback attempt that uses this `fallbacks`
          # entry's `model`. If you leave it out, the attempt uses the request's `thinking`
          # when `model` supports that thinking `type`.
          #
          # If you leave it out and the request's thinking `type` is `between_tools` but
          # `model` doesn't support `between_tools`, the attempt uses `disabled` if `model`
          # supports it. Otherwise, if `model` doesn't support the request's thinking
          # `type`, if the request doesn't set `thinking`, or if you set this field to
          # `null`, the attempt uses the thinking `type` that `model` uses when a request
          # leaves out `thinking`. The request's `thinking.display` still applies where
          # `model` allows it.
          #
          # These rules apply with the `server-side-fallback-2026-07-01` beta header.
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
                    Anthropic::Beta::BetaThinkingConfigBetweenTools,
                    Anthropic::Beta::BetaThinkingConfigAdaptive
                  )
                )
            }
          )
        end
        def to_hash
        end

        # The inference speed mode for the fallback attempt that uses this `fallbacks`
        # entry's `model`. If you leave it out, the attempt runs at `fast` speed only when
        # the request sets `speed` to `fast` and your organization can use fast mode on
        # `model`.
        #
        # Otherwise, or when you set this field to `null`, the attempt runs at `standard`
        # speed.
        #
        # These rules apply with the `server-side-fallback-2026-07-01` beta header.
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

        # The thinking configuration for the fallback attempt that uses this `fallbacks`
        # entry's `model`. If you leave it out, the attempt uses the request's `thinking`
        # when `model` supports that thinking `type`.
        #
        # If you leave it out and the request's thinking `type` is `between_tools` but
        # `model` doesn't support `between_tools`, the attempt uses `disabled` if `model`
        # supports it. Otherwise, if `model` doesn't support the request's thinking
        # `type`, if the request doesn't set `thinking`, or if you set this field to
        # `null`, the attempt uses the thinking `type` that `model` uses when a request
        # leaves out `thinking`. The request's `thinking.display` still applies where
        # `model` allows it.
        #
        # These rules apply with the `server-side-fallback-2026-07-01` beta header.
        module Thinking
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaThinkingConfigEnabled,
                Anthropic::Beta::BetaThinkingConfigDisabled,
                Anthropic::Beta::BetaThinkingConfigBetweenTools,
                Anthropic::Beta::BetaThinkingConfigAdaptive
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaFallbackParam::Thinking::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ENABLED =
              T.let(
                :enabled,
                Anthropic::Beta::BetaFallbackParam::Thinking::Type::TaggedSymbol
              )
            DISABLED =
              T.let(
                :disabled,
                Anthropic::Beta::BetaFallbackParam::Thinking::Type::TaggedSymbol
              )
            BETWEEN_TOOLS =
              T.let(
                :between_tools,
                Anthropic::Beta::BetaFallbackParam::Thinking::Type::TaggedSymbol
              )
            ADAPTIVE =
              T.let(
                :adaptive,
                Anthropic::Beta::BetaFallbackParam::Thinking::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaFallbackParam::Thinking::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaFallbackParam::Thinking::Variants]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Beta::BetaFallbackParam::Thinking::Type::OrSymbol,
              budget_tokens: Integer,
              block_binding:
                T.nilable(Anthropic::Beta::BetaThinkingBlockBinding::OrHash),
              display_:
                T.any(
                  T.nilable(
                    Anthropic::Beta::BetaThinkingConfigEnabled::Display::OrSymbol
                  ),
                  T.nilable(
                    Anthropic::Beta::BetaThinkingConfigAdaptive::Display::OrSymbol
                  )
                )
            ).returns(Anthropic::Beta::BetaFallbackParam::Thinking::Variants)
          end
          def self.new(
            type:,
            # Determines how many tokens Claude can use for its internal reasoning process.
            # Larger budgets can enable more thorough analysis for complex problems, improving
            # response quality.
            #
            # Must be ≥1024 and less than `max_tokens`.
            #
            # See
            # [extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking)
            # for details.
            budget_tokens: nil,
            # Controls for block binding: what happens when a thinking block this request
            # sends back fails the conversation check. `null`, absent or an empty object means
            # every default.
            block_binding: nil,
            # Controls how thinking content appears in the response. When set to `summarized`,
            # thinking is returned normally. When set to `omitted`, thinking content is
            # redacted but a signature is returned for multi-turn continuity. The default
            # depends on the model; see
            # [Controlling thinking display](https://platform.claude.com/docs/en/build-with-claude/thinking#controlling-thinking-display).
            display_: nil
          )
          end
        end
      end
    end
  end
end
