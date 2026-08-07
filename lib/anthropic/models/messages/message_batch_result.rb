# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      # Processing result for this request.
      #
      # Contains a Message output if processing was successful, an error response if
      # processing failed, or the reason why processing was not attempted, such as
      # cancellation or expiration.
      module MessageBatchResult
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :succeeded, -> { Anthropic::Messages::MessageBatchSucceededResult }

        variant :errored, -> { Anthropic::Messages::MessageBatchErroredResult }

        variant :canceled, -> { Anthropic::Messages::MessageBatchCanceledResult }

        variant :expired, -> { Anthropic::Messages::MessageBatchExpiredResult }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Messages::MessageBatchSucceededResult, Anthropic::Models::Messages::MessageBatchErroredResult, Anthropic::Models::Messages::MessageBatchCanceledResult, Anthropic::Models::Messages::MessageBatchExpiredResult)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Anthropic::Models::Message] :message
        #
        #   @option args [Anthropic::Models::ErrorResponse] :error
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Messages::MessageBatchSucceededResult, Anthropic::Models::Messages::MessageBatchErroredResult, Anthropic::Models::Messages::MessageBatchCanceledResult, Anthropic::Models::Messages::MessageBatchExpiredResult]
        def self.new(type:, **args)
          case type.to_sym
          when :succeeded
            Anthropic::Messages::MessageBatchSucceededResult.new(**args)
          when :errored
            Anthropic::Messages::MessageBatchErroredResult.new(**args)
          when :canceled
            Anthropic::Messages::MessageBatchCanceledResult.new(**args)
          when :expired
            Anthropic::Messages::MessageBatchExpiredResult.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    MessageBatchResult = Messages::MessageBatchResult
  end
end
