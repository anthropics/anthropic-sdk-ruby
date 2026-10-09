# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Configuration for Claude's thinking.
      #
      # With `{"type": "adaptive"}`, Claude decides when and how much to think. With
      # `{"type": "enabled"}` (manual extended thinking), you set a `budget_tokens` of
      # at least 1,024. Thinking tokens count toward your `max_tokens` limit.
      #
      # Which `type` values are accepted, and what happens when you omit `thinking`,
      # depend on the model. See
      # [thinking](https://platform.claude.com/docs/en/build-with-claude/thinking#configuring-thinking)
      # for each model's behavior.
      module BetaThinkingConfigParam
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
        # {Anthropic::Models::Beta::BetaThinkingConfigParam} for more details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaThinkingConfigParam::Type, String]
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

    BetaThinkingConfigParam = Beta::BetaThinkingConfigParam
  end
end
