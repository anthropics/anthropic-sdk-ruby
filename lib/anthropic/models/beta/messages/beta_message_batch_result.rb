# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        # Processing result for this request.
        #
        # Contains a Message output if processing was successful, an error response if
        # processing failed, or the reason why processing was not attempted, such as
        # cancellation or expiration.
        module BetaMessageBatchResult
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :succeeded, -> { Anthropic::Beta::Messages::BetaMessageBatchSucceededResult }

          variant :errored, -> { Anthropic::Beta::Messages::BetaMessageBatchErroredResult }

          variant :canceled, -> { Anthropic::Beta::Messages::BetaMessageBatchCanceledResult }

          variant :expired, -> { Anthropic::Beta::Messages::BetaMessageBatchExpiredResult }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult, Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult, Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult, Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Anthropic::Models::Beta::BetaMessage] :message
          #
          #   @option args [Anthropic::Models::BetaErrorResponse] :error
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult, Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult, Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult, Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult]
          def self.new(type:, **args)
            case type.to_sym
            when :succeeded
              Anthropic::Beta::Messages::BetaMessageBatchSucceededResult.new(**args)
            when :errored
              Anthropic::Beta::Messages::BetaMessageBatchErroredResult.new(**args)
            when :canceled
              Anthropic::Beta::Messages::BetaMessageBatchCanceledResult.new(**args)
            when :expired
              Anthropic::Beta::Messages::BetaMessageBatchExpiredResult.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
