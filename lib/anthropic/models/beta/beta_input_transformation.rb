# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # One entry of `input_transformations`: either a change the API made to the
      # request's input before showing it to the model, or a block that failed a binding
      # check and was still shown to the model unchanged. The `type` field says which.
      module BetaInputTransformation
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :thinking_dropped, -> { Anthropic::Beta::BetaThinkingDroppedInputTransformation }

        variant :thinking_mismatch_allowed, -> { Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation }

        module Type
          extend Anthropic::Internal::Type::Enum

          THINKING_DROPPED = :thinking_dropped
          THINKING_MISMATCH_ALLOWED = :thinking_mismatch_allowed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaThinkingDroppedInputTransformation, Anthropic::Models::Beta::BetaThinkingMismatchAllowedInputTransformation)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaInputTransformation} for more details.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :path Where the removed block was in your request, as `messages.{i}.content.{j}`:
        #
        #   @option args [Symbol, Anthropic::Models::Beta::BetaThinkingDroppedInputTransformation::Reason, Symbol, Anthropic::Models::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason] :reason Which binding check removed the block: `model_binding_mismatch` — it was
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaThinkingDroppedInputTransformation, Anthropic::Models::Beta::BetaThinkingMismatchAllowedInputTransformation]
        def self.new(type:, **args)
          case type.to_sym
          when :thinking_dropped
            Anthropic::Beta::BetaThinkingDroppedInputTransformation.new(**args)
          when :thinking_mismatch_allowed
            Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaInputTransformation = Beta::BetaInputTransformation
  end
end
