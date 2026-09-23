# frozen_string_literal: true

module Anthropic
  module Models
    module CacheMissReason
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :model_changed, -> { Anthropic::CacheMissModelChanged }

      variant :system_changed, -> { Anthropic::CacheMissSystemChanged }

      variant :tools_changed, -> { Anthropic::CacheMissToolsChanged }

      variant :messages_changed, -> { Anthropic::CacheMissMessagesChanged }

      variant :previous_message_not_found, -> { Anthropic::CacheMissPreviousMessageNotFound }

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
