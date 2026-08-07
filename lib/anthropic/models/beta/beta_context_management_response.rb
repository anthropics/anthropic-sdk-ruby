# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaContextManagementResponse < Anthropic::Internal::Type::BaseModel
        # @!attribute applied_edits
        #   List of context management edits that were applied.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaClearToolUses20250919EditResponse, Anthropic::Models::Beta::BetaClearThinking20251015EditResponse>]
        required :applied_edits,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaContextManagementResponse::AppliedEdit] }

        # @!method initialize(applied_edits:)
        #   @param applied_edits [Array<Anthropic::Models::Beta::BetaClearToolUses20250919EditResponse, Anthropic::Models::Beta::BetaClearThinking20251015EditResponse>] List of context management edits that were applied.

        module AppliedEdit
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :clear_tool_uses_20250919, -> { Anthropic::Beta::BetaClearToolUses20250919EditResponse }

          variant :clear_thinking_20251015, -> { Anthropic::Beta::BetaClearThinking20251015EditResponse }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaClearToolUses20250919EditResponse, Anthropic::Models::Beta::BetaClearThinking20251015EditResponse)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Integer] :cleared_input_tokens Number of input tokens cleared by this edit.
          #
          #   @option args [Integer] :cleared_tool_uses Number of tool uses that were cleared.
          #
          #   @option args [Integer] :cleared_thinking_turns Number of thinking turns that were cleared.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaClearToolUses20250919EditResponse, Anthropic::Models::Beta::BetaClearThinking20251015EditResponse]
          def self.new(type:, **args)
            case type.to_sym
            when :clear_tool_uses_20250919
              Anthropic::Beta::BetaClearToolUses20250919EditResponse.new(**args)
            when :clear_thinking_20251015
              Anthropic::Beta::BetaClearThinking20251015EditResponse.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaContextManagementResponse = Beta::BetaContextManagementResponse
  end
end
