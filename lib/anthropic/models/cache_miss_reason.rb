# frozen_string_literal: true

module Anthropic
  module Models
    module CacheMissReason
      extend Anthropic::Internal::Type::Union

      discriminator :type

      # A `cache_miss_reason` for a request whose `model` or `speed` differs from the previous request's.
      #
      # See the [cache diagnostics guide](https://platform.claude.com/docs/en/build-with-claude/cache-diagnostics#cache-miss-reason-types) to learn what to change for each reason.
      variant :model_changed, -> { Anthropic::CacheMissModelChanged }

      # A `cache_miss_reason` for a request whose `system` differs from the previous request's.
      #
      # See the [cache diagnostics guide](https://platform.claude.com/docs/en/build-with-claude/cache-diagnostics#cache-miss-reason-types) to learn what to change for each reason.
      variant :system_changed, -> { Anthropic::CacheMissSystemChanged }

      # A `cache_miss_reason` for a request whose `tools` differ from the previous request's, for example because tools were added, removed, or reordered.
      #
      # See the [cache diagnostics guide](https://platform.claude.com/docs/en/build-with-claude/cache-diagnostics#cache-miss-reason-types) to learn what to change for each reason.
      variant :tools_changed, -> { Anthropic::CacheMissToolsChanged }

      # A `cache_miss_reason` for a request whose `messages` differ from the previous request's in an earlier entry, instead of only having entries appended. The `model`, `system`, and `tools` match.
      #
      # See the [cache diagnostics guide](https://platform.claude.com/docs/en/build-with-claude/cache-diagnostics#cache-miss-reason-types) to learn what to change for each reason.
      variant :messages_changed, -> { Anthropic::CacheMissMessagesChanged }

      # A `cache_miss_reason` for when the API doesn't have a stored record of the request that `diagnostics.previous_message_id` references.
      #
      # This doesn't mean that this request changed.
      #
      # See the [cache diagnostics guide](https://platform.claude.com/docs/en/build-with-claude/cache-diagnostics#cache-miss-reason-types) to learn what to change for each reason.
      variant :previous_message_not_found, -> { Anthropic::CacheMissPreviousMessageNotFound }

      # A `cache_miss_reason` for when the API can't give a diagnosis. The request itself was processed normally.
      #
      # This includes a request whose `model`, `system`, and `tools` match the previous request's but whose other prompt-affecting parameters, such as `thinking` or `tool_choice`, differ.
      #
      # See the [cache diagnostics guide](https://platform.claude.com/docs/en/build-with-claude/cache-diagnostics#cache-miss-reason-types) to learn what to change for each reason.
      variant :unavailable, -> { Anthropic::CacheMissUnavailable }

      module Type
        extend Anthropic::Internal::Type::Enum

        MODEL_CHANGED = :model_changed
        SYSTEM_CHANGED = :system_changed
        TOOLS_CHANGED = :tools_changed
        MESSAGES_CHANGED = :messages_changed
        PREVIOUS_MESSAGE_NOT_FOUND = :previous_message_not_found
        UNAVAILABLE = :unavailable

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @!method self.variants
      #   @return [Array(Anthropic::Models::CacheMissModelChanged, Anthropic::Models::CacheMissSystemChanged, Anthropic::Models::CacheMissToolsChanged, Anthropic::Models::CacheMissMessagesChanged, Anthropic::Models::CacheMissPreviousMessageNotFound, Anthropic::Models::CacheMissUnavailable)]

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::CacheMissReason} for more details.
      #
      # @param type [Symbol, Anthropic::Models::CacheMissReason::Type, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [Integer] :cache_missed_input_tokens Approximate number of input tokens that would have been read from cache had the
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::CacheMissModelChanged, Anthropic::Models::CacheMissSystemChanged, Anthropic::Models::CacheMissToolsChanged, Anthropic::Models::CacheMissMessagesChanged, Anthropic::Models::CacheMissPreviousMessageNotFound, Anthropic::Models::CacheMissUnavailable]
      def self.new(type:, **args)
        case type.to_sym
        when :model_changed
          Anthropic::CacheMissModelChanged.new(**args)
        when :system_changed
          Anthropic::CacheMissSystemChanged.new(**args)
        when :tools_changed
          Anthropic::CacheMissToolsChanged.new(**args)
        when :messages_changed
          Anthropic::CacheMissMessagesChanged.new(**args)
        when :previous_message_not_found
          Anthropic::CacheMissPreviousMessageNotFound.new(**args)
        when :unavailable
          Anthropic::CacheMissUnavailable.new(**args)
        else
          raise ArgumentError, "unknown type: #{type}"
        end
      end
    end
  end
end
