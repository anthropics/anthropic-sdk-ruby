# frozen_string_literal: true

module Anthropic
  module Models
    # Configuration for enabling Claude's extended thinking.
    #
    # When enabled, responses include `thinking` content blocks showing Claude's
    # thinking process before the final answer. Requires a minimum budget of 1,024
    # tokens and counts towards your `max_tokens` limit.
    #
    # See
    # [extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking)
    # for details.
    module ThinkingConfigParam
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :enabled, -> { Anthropic::ThinkingConfigEnabled }

      variant :disabled, -> { Anthropic::ThinkingConfigDisabled }

      variant :adaptive, -> { Anthropic::ThinkingConfigAdaptive }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled, Anthropic::Models::ThinkingConfigAdaptive)]

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::ThinkingConfigParam} for more details.
      #
      # @param type [Symbol, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [Integer] :budget_tokens Determines how many tokens Claude can use for its internal reasoning process. La
      #
      #   @option args [Symbol, Anthropic::Models::ThinkingConfigEnabled::Display, nil, Symbol, Anthropic::Models::ThinkingConfigAdaptive::Display, nil] :display_ Controls how thinking content appears in the response. When set to `summarized`,
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled, Anthropic::Models::ThinkingConfigAdaptive]
      def self.new(type:, **args)
        case type.to_sym
        when :enabled
          Anthropic::ThinkingConfigEnabled.new(**args)
        when :disabled
          Anthropic::ThinkingConfigDisabled.new(**args)
        when :adaptive
          Anthropic::ThinkingConfigAdaptive.new(**args)
        else
          raise ArgumentError, "unknown type: #{type}"
        end
      end
    end
  end
end
