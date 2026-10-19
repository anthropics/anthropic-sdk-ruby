# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaFallbackParam < Anthropic::Internal::Type::BaseModel
        # @!attribute model
        #   The model that will complete your prompt.
        #
        #   See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   details and options.
        #
        #   @return [Symbol, String, Anthropic::Models::Model]
        required :model, union: -> { Anthropic::Model }

        # @!attribute max_tokens
        #   The `max_tokens` for the fallback attempt that uses this `fallbacks` entry's
        #   `model`, in place of the request's `max_tokens`. If you leave it out or set it
        #   to `null`, the attempt uses the request's `max_tokens`.
        #
        #   See the
        #   [refusals and fallback guide](https://platform.claude.com/docs/en/build-with-claude/refusals-and-fallback#naming-your-own-fallback-models)
        #   to learn more about fallback entries.
        #
        #   @return [Integer, nil]
        optional :max_tokens, Integer, nil?: true

        # @!attribute output_config
        #   Output parameters for the fallback attempt that uses this `fallbacks` entry's
        #   `model`, combined with the request's `output_config` one field at a time.
        #
        #   - `format`: If you leave it out, the attempt uses the request's `format`. If you
        #     set it to `null`, the attempt runs without a format.
        #   - `effort`: If you leave it out, the attempt uses the request's `effort` when
        #     `model` supports that level with the attempt's `thinking`. If the request
        #     doesn't set `effort`, if `model` doesn't support the level, or if you set
        #     `effort` to `null`, the attempt runs at the default effort of `model`.
        #   - `task_budget`: If you leave it out, the attempt uses the request's
        #     `task_budget` when `model` accepts a task budget of that size. If the request
        #     doesn't set `task_budget`, if `model` doesn't accept it, or if you set
        #     `task_budget` to `null`, the attempt runs without a task budget.
        #
        #   Set `output_config` to `null` to run the attempt without a format or a task
        #   budget, at the default effort of `model`.
        #
        #   These rules apply with the `server-side-fallback-2026-07-01` beta header.
        #
        #   @return [Anthropic::Models::Beta::BetaOutputConfig, nil]
        optional :output_config, -> { Anthropic::Beta::BetaOutputConfig }, nil?: true

        # @!attribute speed
        #   The inference speed mode for the fallback attempt that uses this `fallbacks`
        #   entry's `model`. If you leave it out, the attempt runs at `fast` speed only when
        #   the request sets `speed` to `fast` and your organization can use fast mode on
        #   `model`.
        #
        #   Otherwise, or when you set this field to `null`, the attempt runs at `standard`
        #   speed.
        #
        #   These rules apply with the `server-side-fallback-2026-07-01` beta header.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaFallbackParam::Speed, nil]
        optional :speed, enum: -> { Anthropic::Beta::BetaFallbackParam::Speed }, nil?: true

        # @!attribute thinking
        #   The thinking configuration for the fallback attempt that uses this `fallbacks`
        #   entry's `model`. If you leave it out, the attempt uses the request's `thinking`
        #   when `model` supports that thinking `type`.
        #
        #   If you leave it out and the request's thinking `type` is `between_tools` but
        #   `model` doesn't support `between_tools`, the attempt uses `disabled` if `model`
        #   supports it. Otherwise, if `model` doesn't support the request's thinking
        #   `type`, if the request doesn't set `thinking`, or if you set this field to
        #   `null`, the attempt uses the thinking `type` that `model` uses when a request
        #   leaves out `thinking`. The request's `thinking.display` still applies where
        #   `model` allows it.
        #
        #   These rules apply with the `server-side-fallback-2026-07-01` beta header.
        #
        #   @return [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled, Anthropic::Models::Beta::BetaThinkingConfigBetweenTools, Anthropic::Models::Beta::BetaThinkingConfigAdaptive, nil]
        optional :thinking, union: -> { Anthropic::Beta::BetaFallbackParam::Thinking }, nil?: true

        # @!method initialize(model:, max_tokens: nil, output_config: nil, speed: nil, thinking: nil)
        #   One entry in the `fallbacks` chain on a `/v1/messages` request.
        #
        #   `model` is required. The override fields (`max_tokens`, `thinking`,
        #   `output_config`, and `speed`) set the corresponding parameter for this attempt
        #   only and are validated as if the request were made to `model`. Any other key is
        #   rejected at parse time.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaFallbackParam} for more details.
        #
        #   @param model [Symbol, String, Anthropic::Models::Model] The model that will complete your prompt.
        #
        #   @param max_tokens [Integer, nil] The `max_tokens` for the fallback attempt that uses this `fallbacks` entry's `mo
        #
        #   @param output_config [Anthropic::Models::Beta::BetaOutputConfig, nil] Output parameters for the fallback attempt that uses this `fallbacks` entry's `m
        #
        #   @param speed [Symbol, Anthropic::Models::Beta::BetaFallbackParam::Speed, nil] The inference speed mode for the fallback attempt that uses this `fallbacks` ent
        #
        #   @param thinking [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled, Anthropic::Models::Beta::BetaThinkingConfigBetweenTools, Anthropic::Models::Beta::BetaThinkingConfigAdaptive, nil] The thinking configuration for the fallback attempt that uses this `fallbacks` e

        # The inference speed mode for the fallback attempt that uses this `fallbacks`
        # entry's `model`. If you leave it out, the attempt runs at `fast` speed only when
        # the request sets `speed` to `fast` and your organization can use fast mode on
        # `model`.
        #
        # Otherwise, or when you set this field to `null`, the attempt runs at `standard`
        # speed.
        #
        # These rules apply with the `server-side-fallback-2026-07-01` beta header.
        #
        # @see Anthropic::Models::Beta::BetaFallbackParam#speed
        module Speed
          extend Anthropic::Internal::Type::Enum

          STANDARD = :standard
          FAST = :fast

          # @!method self.values
          #   @return [Array<Symbol>]
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
        #
        # @see Anthropic::Models::Beta::BetaFallbackParam#thinking
        module Thinking
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :enabled, -> { Anthropic::Beta::BetaThinkingConfigEnabled }

          variant :disabled, -> { Anthropic::Beta::BetaThinkingConfigDisabled }

          variant :between_tools, -> { Anthropic::Beta::BetaThinkingConfigBetweenTools }

          variant :adaptive, -> { Anthropic::Beta::BetaThinkingConfigAdaptive }

          module Type
            extend Anthropic::Internal::Type::Enum

            ENABLED = :enabled
            DISABLED = :disabled
            BETWEEN_TOOLS = :between_tools
            ADAPTIVE = :adaptive

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled, Anthropic::Models::Beta::BetaThinkingConfigBetweenTools, Anthropic::Models::Beta::BetaThinkingConfigAdaptive)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::BetaFallbackParam::Thinking} for more details.
          #
          # @param type [Symbol, Anthropic::Models::Beta::BetaFallbackParam::Thinking::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Integer] :budget_tokens Determines how many tokens Claude can use for its internal reasoning process. La
          #
          #   @option args [Anthropic::Models::Beta::BetaThinkingBlockBinding, nil] :block_binding Controls for block binding: what happens when a thinking block this request send
          #
          #   @option args [Symbol, Anthropic::Models::Beta::BetaThinkingConfigEnabled::Display, nil, Symbol, Anthropic::Models::Beta::BetaThinkingConfigAdaptive::Display, nil] :display_ Controls how thinking content appears in the response. When set to `summarized`,
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled, Anthropic::Models::Beta::BetaThinkingConfigBetweenTools, Anthropic::Models::Beta::BetaThinkingConfigAdaptive]
          def self.new(type:, **args)
            case type.to_sym
            when :enabled
              Anthropic::Beta::BetaThinkingConfigEnabled.new(**args)
            when :disabled
              Anthropic::Beta::BetaThinkingConfigDisabled.new(**args)
            when :between_tools
              Anthropic::Beta::BetaThinkingConfigBetweenTools.new(**args)
            when :adaptive
              Anthropic::Beta::BetaThinkingConfigAdaptive.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaFallbackParam = Beta::BetaFallbackParam
  end
end
