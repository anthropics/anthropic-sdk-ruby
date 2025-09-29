# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaClearToolUses20250919Edit < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :clear_tool_uses_20250919]
        required :type, const: :clear_tool_uses_20250919

        # @!attribute clear_at_least
        #   Minimum number of tokens that must be cleared when triggered. Context will only
        #   be modified if at least this many tokens can be removed.
        #
        #   @return [Anthropic::Models::Beta::BetaInputTokensClearAtLeast, nil]
        optional :clear_at_least, -> { Anthropic::Beta::BetaInputTokensClearAtLeast }, nil?: true

        # @!attribute clear_tool_inputs
        #   Whether to clear all tool inputs (bool) or specific tool inputs to clear (list)
        #
        #   @return [Boolean, Array<String>, nil]
        optional :clear_tool_inputs,
                 union: -> { Anthropic::Beta::BetaClearToolUses20250919Edit::ClearToolInputs },
                 nil?: true

        # @!attribute exclude_tools
        #   Tool names whose uses are preserved from clearing
        #
        #   @return [Array<String>, nil]
        optional :exclude_tools, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute keep
        #   Number of tool uses to retain in the conversation
        #
        #   @return [Anthropic::Models::Beta::BetaToolUsesKeep, nil]
        optional :keep, -> { Anthropic::Beta::BetaToolUsesKeep }

        # @!attribute trigger
        #   Condition that triggers the context management strategy
        #
        #   @return [Anthropic::Models::Beta::BetaInputTokensTrigger, Anthropic::Models::Beta::BetaToolUsesTrigger, nil]
        optional :trigger, union: -> { Anthropic::Beta::BetaClearToolUses20250919Edit::Trigger }

        # @!method initialize(clear_at_least: nil, clear_tool_inputs: nil, exclude_tools: nil, keep: nil, trigger: nil, type: :clear_tool_uses_20250919)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaClearToolUses20250919Edit} for more details.
        #
        #   @param clear_at_least [Anthropic::Models::Beta::BetaInputTokensClearAtLeast, nil] Minimum number of tokens that must be cleared when triggered. Context will only
        #
        #   @param clear_tool_inputs [Boolean, Array<String>, nil] Whether to clear all tool inputs (bool) or specific tool inputs to clear (list)
        #
        #   @param exclude_tools [Array<String>, nil] Tool names whose uses are preserved from clearing
        #
        #   @param keep [Anthropic::Models::Beta::BetaToolUsesKeep] Number of tool uses to retain in the conversation
        #
        #   @param trigger [Anthropic::Models::Beta::BetaInputTokensTrigger, Anthropic::Models::Beta::BetaToolUsesTrigger] Condition that triggers the context management strategy
        #
        #   @param type [Symbol, :clear_tool_uses_20250919]

        # Whether to clear all tool inputs (bool) or specific tool inputs to clear (list)
        #
        # @see Anthropic::Models::Beta::BetaClearToolUses20250919Edit#clear_tool_inputs
        module ClearToolInputs
          extend Anthropic::Internal::Type::Union

          variant Anthropic::Internal::Type::Boolean

          variant -> { Anthropic::Models::Beta::BetaClearToolUses20250919Edit::ClearToolInputs::StringArray }

          # @!method self.variants
          #   @return [Array(Boolean, Array<String>)]

          # @type [Anthropic::Internal::Type::Converter]
          StringArray = Anthropic::Internal::Type::ArrayOf[String]
        end

        # Condition that triggers the context management strategy
        #
        # @see Anthropic::Models::Beta::BetaClearToolUses20250919Edit#trigger
        module Trigger
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :input_tokens, -> { Anthropic::Beta::BetaInputTokensTrigger }

          variant :tool_uses, -> { Anthropic::Beta::BetaToolUsesTrigger }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaInputTokensTrigger, Anthropic::Models::Beta::BetaToolUsesTrigger)]
        end
      end
    end

    BetaClearToolUses20250919Edit = Beta::BetaClearToolUses20250919Edit
  end
end
