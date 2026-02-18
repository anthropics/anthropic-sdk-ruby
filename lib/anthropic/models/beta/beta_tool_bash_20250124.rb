# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolBash20250124 < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #   This is how the tool will be called by the model and in `tool_use` blocks.
        #
        #   @return [Symbol, :bash]
        required :name, const: :bash

        # @!attribute type
        #
        #   @return [Symbol, :bash_20250124]
        required :type, const: :bash_20250124

        # @!attribute allowed_callers
        #
        #   @return [Array<Symbol, Anthropic::Models::Beta::BetaToolBash20250124::AllowedCaller>, nil]
        optional :allowed_callers,
                 -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::BetaToolBash20250124::AllowedCaller] }

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute defer_loading
        #   If true, tool will not be included in initial system prompt. Only loaded when
        #   returned via tool_reference from tool search.
        #
        #   @return [Boolean, nil]
        optional :defer_loading, Anthropic::Internal::Type::Boolean

        # @!attribute input_examples
        #
        #   @return [Array<Hash{Symbol=>Object}>, nil]
        optional :input_examples,
                 Anthropic::Internal::Type::ArrayOf[Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]]

        # @!attribute strict
        #   When true, guarantees schema validation on tool names and inputs
        #
        #   @return [Boolean, nil]
        optional :strict, Anthropic::Internal::Type::Boolean

        # @!method initialize(allowed_callers: nil, cache_control: nil, defer_loading: nil, input_examples: nil, strict: nil, name: :bash, type: :bash_20250124)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaToolBash20250124} for more details.
        #
        #   @param allowed_callers [Array<Symbol, Anthropic::Models::Beta::BetaToolBash20250124::AllowedCaller>]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param defer_loading [Boolean] If true, tool will not be included in initial system prompt. Only loaded when re
        #
        #   @param input_examples [Array<Hash{Symbol=>Object}>]
        #
        #   @param strict [Boolean] When true, guarantees schema validation on tool names and inputs
        #
        #   @param name [Symbol, :bash] Name of the tool.
        #
        #   @param type [Symbol, :bash_20250124]

        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          DIRECT = :direct
          CODE_EXECUTION_20250825 = :code_execution_20250825
          CODE_EXECUTION_20260120 = :code_execution_20260120

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaToolBash20250124 = Beta::BetaToolBash20250124
  end
end
