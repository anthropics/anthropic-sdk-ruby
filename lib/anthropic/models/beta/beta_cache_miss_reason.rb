# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaCacheMissReason
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :model_changed, -> { Anthropic::Beta::BetaCacheMissModelChanged }

        variant :system_changed, -> { Anthropic::Beta::BetaCacheMissSystemChanged }

        variant :tools_changed, -> { Anthropic::Beta::BetaCacheMissToolsChanged }

        variant :messages_changed, -> { Anthropic::Beta::BetaCacheMissMessagesChanged }

        variant :previous_message_not_found, -> { Anthropic::Beta::BetaCacheMissPreviousMessageNotFound }

        variant :unavailable, -> { Anthropic::Beta::BetaCacheMissUnavailable }

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
        #   @return [Array(Anthropic::Models::Beta::BetaCacheMissModelChanged, Anthropic::Models::Beta::BetaCacheMissSystemChanged, Anthropic::Models::Beta::BetaCacheMissToolsChanged, Anthropic::Models::Beta::BetaCacheMissMessagesChanged, Anthropic::Models::Beta::BetaCacheMissPreviousMessageNotFound, Anthropic::Models::Beta::BetaCacheMissUnavailable)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaCacheMissReason} for more details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaCacheMissReason::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Integer] :cache_missed_input_tokens Approximate number of input tokens that would have been read from cache had the
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaCacheMissModelChanged, Anthropic::Models::Beta::BetaCacheMissSystemChanged, Anthropic::Models::Beta::BetaCacheMissToolsChanged, Anthropic::Models::Beta::BetaCacheMissMessagesChanged, Anthropic::Models::Beta::BetaCacheMissPreviousMessageNotFound, Anthropic::Models::Beta::BetaCacheMissUnavailable]
        def self.new(type:, **args)
          case type.to_sym
          when :model_changed
            Anthropic::Beta::BetaCacheMissModelChanged.new(**args)
          when :system_changed
            Anthropic::Beta::BetaCacheMissSystemChanged.new(**args)
          when :tools_changed
            Anthropic::Beta::BetaCacheMissToolsChanged.new(**args)
          when :messages_changed
            Anthropic::Beta::BetaCacheMissMessagesChanged.new(**args)
          when :previous_message_not_found
            Anthropic::Beta::BetaCacheMissPreviousMessageNotFound.new(**args)
          when :unavailable
            Anthropic::Beta::BetaCacheMissUnavailable.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaCacheMissReason = Beta::BetaCacheMissReason
  end
end
