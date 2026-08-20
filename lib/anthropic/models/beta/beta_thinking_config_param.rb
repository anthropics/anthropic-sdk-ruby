# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Configuration for enabling Claude's extended thinking.
      #
      # When enabled, responses include `thinking` content blocks showing Claude's
      # thinking process before the final answer. Requires a minimum budget of 1,024
      # tokens and counts towards your `max_tokens` limit.
      #
      # See
      # [extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking)
      # for details.
      module BetaThinkingConfigParam
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :enabled, -> { Anthropic::Beta::BetaThinkingConfigEnabled }

        variant :disabled, -> { Anthropic::Beta::BetaThinkingConfigDisabled }

        variant :adaptive, -> { Anthropic::Beta::BetaThinkingConfigAdaptive }

        module Type
          extend Anthropic::Internal::Type::Enum

          ENABLED = :enabled
          DISABLED = :disabled
          ADAPTIVE = :adaptive

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled, Anthropic::Models::Beta::BetaThinkingConfigAdaptive)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaThinkingConfigParam} for more details.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Integer] :budget_tokens Determines how many tokens Claude can use for its internal reasoning process. La
        #
        #   @option args [Symbol, Anthropic::Models::Beta::BetaThinkingConfigEnabled::Display, nil, Symbol, Anthropic::Models::Beta::BetaThinkingConfigAdaptive::Display, nil] :display_ Controls how thinking content appears in the response. When set to `summarized`,
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled, Anthropic::Models::Beta::BetaThinkingConfigAdaptive]
        def self.new(type:, **args)
          case type.to_sym
          when :enabled
            Anthropic::Beta::BetaThinkingConfigEnabled.new(**args)
          when :disabled
            Anthropic::Beta::BetaThinkingConfigDisabled.new(**args)
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
