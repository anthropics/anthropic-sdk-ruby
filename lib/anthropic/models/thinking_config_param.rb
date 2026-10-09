# frozen_string_literal: true

module Anthropic
  module Models
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
    module ThinkingConfigParam
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :enabled, -> { Anthropic::ThinkingConfigEnabled }

      variant :disabled, -> { Anthropic::ThinkingConfigDisabled }

      variant :between_tools, -> { Anthropic::ThinkingConfigBetweenTools }

      variant :adaptive, -> { Anthropic::ThinkingConfigAdaptive }

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
      #   @return [Array(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled, Anthropic::Models::ThinkingConfigBetweenTools, Anthropic::Models::ThinkingConfigAdaptive)]

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::ThinkingConfigParam} for more details.
      #
      # @param type [Symbol, Anthropic::Models::ThinkingConfigParam::Type, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [Integer] :budget_tokens Determines how many tokens Claude can use for its internal reasoning process. La
      #
      #   @option args [Symbol, Anthropic::Models::ThinkingConfigEnabled::Display, nil, Symbol, Anthropic::Models::ThinkingConfigAdaptive::Display, nil] :display_ Controls how thinking content appears in the response. When set to `summarized`,
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled, Anthropic::Models::ThinkingConfigBetweenTools, Anthropic::Models::ThinkingConfigAdaptive]
      def self.new(type:, **args)
        case type.to_sym
        when :enabled
          Anthropic::ThinkingConfigEnabled.new(**args)
        when :disabled
          Anthropic::ThinkingConfigDisabled.new(**args)
        when :between_tools
          Anthropic::ThinkingConfigBetweenTools.new(**args)
        when :adaptive
          Anthropic::ThinkingConfigAdaptive.new(**args)
        else
          raise ArgumentError, "unknown type: #{type}"
        end
      end
    end
  end
end
