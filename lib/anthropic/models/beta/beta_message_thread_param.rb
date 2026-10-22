# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Server-held conversation state (a Thread). `{"type": "create"}` asks the server
      # to hold this conversation's state under the response's `id`;
      # `{"type": "continue", "previous_message_id": ...}` resumes from a previous
      # response so only the new turn's messages are sent. The response shape is
      # unchanged.
      module BetaMessageThreadParam
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # Start holding conversation state under this response's ``id``.
        variant :create, -> { Anthropic::Beta::BetaThreadCreateParams }

        # Resume from the response named by ``previous_message_id``.
        variant :continue, -> { Anthropic::Beta::BetaThreadContinueParams }

        module Type
          extend Anthropic::Internal::Type::Enum

          CREATE = :create
          CONTINUE = :continue

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaThreadCreateParams, Anthropic::Models::Beta::BetaThreadContinueParams)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaMessageThreadParam::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :previous_message_id The `id` of the previous response in this Thread.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaThreadCreateParams, Anthropic::Models::Beta::BetaThreadContinueParams]
        def self.new(type:, **args)
          case type.to_sym
          when :create
            Anthropic::Beta::BetaThreadCreateParams.new(**args)
          when :continue
            Anthropic::Beta::BetaThreadContinueParams.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaMessageThreadParam = Beta::BetaMessageThreadParam
  end
end
