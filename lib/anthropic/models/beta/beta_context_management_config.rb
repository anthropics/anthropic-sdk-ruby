# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaContextManagementConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute edits
        #   List of context management edits to apply
        #
        #   @return [Array<Anthropic::Models::Beta::BetaClearToolUses20250919Edit, Anthropic::Models::Beta::BetaClearThinking20251015Edit, Anthropic::Models::Beta::BetaCompact20260112Edit>, nil]
        optional :edits,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaContextManagementConfig::Edit] }

        # @!method initialize(edits: nil)
        #   @param edits [Array<Anthropic::Models::Beta::BetaClearToolUses20250919Edit, Anthropic::Models::Beta::BetaClearThinking20251015Edit, Anthropic::Models::Beta::BetaCompact20260112Edit>] List of context management edits to apply

        # Automatically compact older context when reaching the configured trigger
        # threshold.
        module Edit
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :clear_tool_uses_20250919, -> { Anthropic::Beta::BetaClearToolUses20250919Edit }

          variant :clear_thinking_20251015, -> { Anthropic::Beta::BetaClearThinking20251015Edit }

          # Automatically compact older context when reaching the configured trigger threshold.
          variant :compact_20260112, -> { Anthropic::Beta::BetaCompact20260112Edit }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaClearToolUses20250919Edit, Anthropic::Models::Beta::BetaClearThinking20251015Edit, Anthropic::Models::Beta::BetaCompact20260112Edit)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::BetaContextManagementConfig::Edit} for more details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Anthropic::Models::Beta::BetaInputTokensClearAtLeast, nil] :clear_at_least Minimum number of tokens that must be cleared when triggered. Context will only
          #
          #   @option args [Boolean, Array<String>, nil] :clear_tool_inputs Whether to clear all tool inputs (bool) or specific tool inputs to clear (list)
          #
          #   @option args [Array<String>, nil] :exclude_tools Tool names whose uses are preserved from clearing
          #
          #   @option args [Anthropic::Models::Beta::BetaToolUsesKeep, Anthropic::Models::Beta::BetaThinkingTurns, Anthropic::Models::Beta::BetaAllThinkingTurns, Symbol, :all] :keep Number of tool uses to retain in the conversation
          #
          #   @option args [Anthropic::Models::Beta::BetaInputTokensTrigger, Anthropic::Models::Beta::BetaToolUsesTrigger, Anthropic::Models::Beta::BetaInputTokensTrigger, nil] :trigger Condition that triggers the context management strategy
          #
          #   @option args [String, nil] :instructions Additional instructions for summarization.
          #
          #   @option args [Boolean] :pause_after_compaction Whether to pause after compaction and return the compaction block to the user.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaClearToolUses20250919Edit, Anthropic::Models::Beta::BetaClearThinking20251015Edit, Anthropic::Models::Beta::BetaCompact20260112Edit]
          def self.new(type:, **args)
            case type.to_sym
            when :clear_tool_uses_20250919
              Anthropic::Beta::BetaClearToolUses20250919Edit.new(**args)
            when :clear_thinking_20251015
              Anthropic::Beta::BetaClearThinking20251015Edit.new(**args)
            when :compact_20260112
              Anthropic::Beta::BetaCompact20260112Edit.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaContextManagementConfig = Beta::BetaContextManagementConfig
  end
end
